# frozen_string_literal: true

# Active Record Model representing programming languages. Instance names are limitted to
# actual progamming languages as dictated by a list scraped from Wikipedia and stored in
# the 'POSSIBLE_NAMES' array.
class Language < ApplicationRecord
  POSSIBLE_NAMES = File.read('./app/assets/possible_language_names.txt').split(', ')
  DISPLAY_COLORS = ['#EFBDEB', '#FF9F1C', '#D90368', '#7F96FF', '#A30B37', '#EF233C'].freeze

  has_many :notes
  has_many :external_resources
  has_many :topics, through: :notes

  validates :name, inclusion: { in: POSSIBLE_NAMES, message: 'must be a software development language' }
  validates :name, presence: true, uniqueness: true

  def initialize(attributes = {})
    super
    self.display_color = DISPLAY_COLORS.sample
  end

  def self.possible_names
    POSSIBLE_NAMES
  end

  def self.search(term)
    where('name Like ?', "%#{term}%")
  end
end
