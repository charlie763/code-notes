class Note < ApplicationRecord
  has_and_belongs_to_many :topics
  has_and_belongs_to_many :external_resources
  has_many :code_snippets
  belongs_to :user
  belongs_to :language

  validates :title, presence: true

  def self.search(terms)
    results = results.where("title LIKE ?", "%#{terms[:keyword]}%").or(results.where("summary LIKE ?", "%#{terms[:keyword]}%")) if terms[:keyword]
    results = results.joins(:language).where(languages: {name: terms[:language]}) if terms[:language]
    results = results.joins(:topics).where('topics.name LIKE ?', "%#{terms[:topic]}%") if terms[:topic]
    results
  end
end
