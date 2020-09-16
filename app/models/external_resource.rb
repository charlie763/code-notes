# frozen_string_literal: true

# Active Record Model representing a resource (i.e. link, article etc.) that can be associated
# with either a note or a language.
class ExternalResource < ApplicationRecord
  belongs_to :language, required: false
  belongs_to :user, required: false
  has_and_belongs_to_many :notes

  validates :name, presence: true
  validate :url_or_description_present

  def display_description
    description&.present? ? description : '(no description)'
  end

  private

  def url_or_description_present
    errors.add(:url_or_description, 'either a url or description must be given') if !url && !description
  end
end
