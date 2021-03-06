# frozen_string_literal: true

# Active Record Model representing notes, the main model users interact with and that other models
# associate through. Also contains main search method.
class Note < ApplicationRecord
  # custom topics.build method created so that it first checks for existing topics before building a new topic,
  # and also makes sure that the existing topic is not already associated with the note instance
  has_and_belongs_to_many :topics do
    def build(attributes = {})
      note = proxy_association.owner
      if attributes.present?
        attributes.values.each do |topic_name|
          next unless topic_name.present?

          new_topic = Topic.find_by(name: topic_name) || Topic.new(name: topic_name)
          if note.persisted? && new_topic.persisted?
            new_topic.notes << note unless note.topics.pluck(:id).include?(new_topic.id)
          else
            note.topics << new_topic
          end
        end
      else
        note.topics << Topic.new unless note.persisted?
      end
    end
  end

  has_and_belongs_to_many :external_resources
  has_many :code_snippets
  belongs_to :user
  belongs_to :language

  accepts_nested_attributes_for :language
  accepts_nested_attributes_for :topics, reject_if: :all_blank
  accepts_nested_attributes_for :code_snippets, reject_if: :all_blank
  accepts_nested_attributes_for :external_resources, reject_if: proc { |attr_hash| attr_hash['name'].blank? || (attr_hash['url'].blank? && attr_hash['description'].blank?) }

  validates :title, presence: true

  def self.search(terms, current_user)
    results = all
    if terms[:keyword].present?
      results = results.where('title LIKE ?', "%#{terms[:keyword]}%").or(results.where('summary LIKE ?', "%#{terms[:keyword]}%"))
    end
    results = results.joins(:language).where('languages.name LIKE ?', "%#{terms[:language]}%") if terms[:language].present?
    results = results.joins(:topics).where('topics.name LIKE ?', "%#{terms[:topic]}%") if terms[:topic].present?
    results = results.joins(:user).where(user: current_user) if terms[:user] == 'me'
    results = results.joins(:user).where.not(user: current_user) if terms[:user] == 'others'
    results
  end

  # this custom build method allows Language to be found by other attribute than id
  def build_language(attributes = {})
    language = attributes.present? ? Language.find_by(attributes) : nil
    self.language = language || Language.new(attributes)
  end
end
