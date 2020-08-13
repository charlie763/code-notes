class Note < ApplicationRecord
  has_and_belongs_to_many :topics
  has_and_belongs_to_many :external_resources
  has_many :code_snippets
  belongs_to :user
  belongs_to :language

  validates :title, presence: true

  def search(terms)
    #assume terms looks like {language: "Ruby", topic: "Rails", keyword: "querying" }
    #Note.joins(:language).where(languages: {name: "Ruby"}) --> finds all notes where language == Ruby
    #for each pair in a terms hash, construct a query statement and change that on to the last
    #    SELECT * FROM table WHERE Contains(Column, '"*test*"') > 0;
    #Note.where('summary LIKE ?', "%ipsum%")


  end
end
