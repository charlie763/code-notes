class Note < ApplicationRecord
  has_and_belongs_to_many :topics
  has_and_belongs_to_many :external_resources
  has_many :code_snippets
  belongs_to :user
  belongs_to :language

  accepts_nested_attributes_for :language, reject_if: :all_blank
  accepts_nested_attributes_for :topics, reject_if: :all_blank
  accepts_nested_attributes_for :code_snippets, reject_if: :all_blank

  validates :title, presence: true

  def self.search(terms)
    results = self
    results = results.where("title LIKE ?", "%#{terms[:keyword]}%").or(results.where("summary LIKE ?", "%#{terms[:keyword]}%")) if terms[:keyword].present?
    results = results.joins(:language).where(languages: {name: terms[:language]}) if terms[:language].present?
    results = results.joins(:topics).where('topics.name LIKE ?', "%#{terms[:topic]}%") if terms[:topic].present?
    results
  end
end
