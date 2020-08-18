class Note < ApplicationRecord
  has_and_belongs_to_many :topics 
  has_and_belongs_to_many :external_resources
  has_many :code_snippets
  belongs_to :user
  belongs_to :language

  accepts_nested_attributes_for :language, reject_if: :all_blank
  accepts_nested_attributes_for :topics
  accepts_nested_attributes_for :code_snippets, reject_if: :all_blank

  validates :title, presence: true

  def self.search(terms)
    results = self
    results = results.where("title LIKE ?", "%#{terms[:keyword]}%").or(results.where("summary LIKE ?", "%#{terms[:keyword]}%")) if terms[:keyword].present?
    results = results.joins(:language).where('languages.name LIKE ?', "%#{terms[:language]}%") if terms[:language].present?
    results = results.joins(:topics).where('topics.name LIKE ?', "%#{terms[:topic]}%") if terms[:topic].present?
    results
  end

  def add_language(language_params)
    language = Language.find_by(language_params)
    self.language = language || Language.new(language_params)
  end

  def add_topics(topics_params)
    new_topics = topics_params.values.map{|attr_hash| Topic.find_or_create_by(attr_hash)}
    new_topics.each{|topic| self.topics << topic unless self.topics.include?(topic)} 
  end
end
