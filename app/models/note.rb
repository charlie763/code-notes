class Note < ApplicationRecord
  has_and_belongs_to_many :topics
  has_and_belongs_to_many :external_resources
  has_many :code_snippets
  belongs_to :user
  belongs_to :language

  validates :title, presence: true
end
