class ExternalResource < ApplicationRecord
  belongs_to :language, required: false
  belongs_to :user, required: false
  has_and_belongs_to_many :notes

  validates :name, presence: true
  validate :url_or_description_present

  def display_description
    description ? description : "(no description)"
  end

  private
  def url_or_description_present
    if !url && !description
      errors.add(:url_or_description, "either a url or description must be given")
    end
  end
end
