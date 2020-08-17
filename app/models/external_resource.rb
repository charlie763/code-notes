class ExternalResource < ApplicationRecord
  belongs_to :language, required: false
  belongs_to :user
  has_and_belongs_to_many :notes

  def display_description
    description ? description : "(no description)"
  end
end
