class Note < ApplicationRecord
  has_and_belongs_to_many :topics
  has_and_belongs_to_many :external_resources
  has_many :code_snippets
  belongs_to :user
  belongs_to :language

  validates :title, presence: true

  def self.search(terms)
    #assume terms looks like {language: "Ruby", topic: "Rails", keyword: "querying" }
    #Note.joins(:language).where(languages: {name: "Ruby"}) --> finds all notes where language == Ruby
    # concatenation: Note.joins(:language).where(languages: {name: "Ruby"}).joins(:topics).where(topics: {name: "topic10"})
    #for each pair in a terms hash, construct a query statement and change that on to the last
    #    SELECT * FROM table WHERE Contains(Column, '"*test*"') > 0;
    #Note.where('summary LIKE ?', "%ipsum%")
    # want to be able to say something like "self.send(join, :language").where(languages: {name: "#{terms[:language]}"})
    results = self
    results = results.where("title LIKE ?", "%#{terms[:keyword]}%").or(results.where("summary LIKE ?", "%#{terms[:keyword]}%")) if terms[:keyword]
    results = results.joins(:language).where(languages: {name: terms[:language]}) if terms[:language]
    results = results.joins(:topics).where(topics: {name: terms[:topic]}) if terms[:topic]
    results
  end
end
