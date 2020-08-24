class Note < ApplicationRecord
  has_and_belongs_to_many :topics 
  has_and_belongs_to_many :external_resources
  has_many :code_snippets
  belongs_to :user
  belongs_to :language

  accepts_nested_attributes_for :language, reject_if: :all_blank
  accepts_nested_attributes_for :topics, reject_if: :all_blank 
  accepts_nested_attributes_for :code_snippets, reject_if: :all_blank
  accepts_nested_attributes_for :external_resources, reject_if: proc{|attr_hash| attr_hash['name'].blank? || (attr_hash['url'].blank? && attr_hash['description'].blank?)}

  validates :title, presence: true

  def self.search(terms, current_user)
    results = self.all
    results = results.where("title LIKE ?", "%#{terms[:keyword]}%").or(results.where("summary LIKE ?", "%#{terms[:keyword]}%")) if terms[:keyword].present?
    results = results.joins(:language).where('languages.name LIKE ?', "%#{terms[:language]}%") if terms[:language].present?
    results = results.joins(:topics).where('topics.name LIKE ?', "%#{terms[:topic]}%") if terms[:topic].present?
    results = results.joins(:user).where(user: current_user) if terms[:user] == "me"
    results = results.joins(:user).where.not(user: current_user) if terms[:user] == "others"
    results
  end

  def add_language(language_params)
    language = Language.find_by(language_params)
    self.language = language || Language.new(language_params)
  end

  def add_topics(topic_params)
    topic_params.values.each do |topic| 
      if topic[:name].present?
        new_topic = Topic.find_or_create_by(topic)
        if self.persisted?
          new_topic.notes << self unless self.topics.pluck(:id).include?(new_topic.id)
        else
          self.topics << new_topic
        end
      end
    end
  end

  # private
  # def validate_topics
  #   self.topics.each do |topic| 
  #     if topic.invalid?
  #       topic.errors.messages.each do |error_key, error_value| 
  #         self.errors.add("topic.#{error_key}".to_sym, error_value.first)
  #       end
  #     end
  #   end 
  # end
end
