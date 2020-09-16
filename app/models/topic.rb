# frozen_string_literal: true

# Active Record Model representing a topic that can be associated with a note or a language through a
# note. Topics are user generated and their name should be unique.
class Topic < ApplicationRecord
  DISPLAY_COLORS = ['#EFBDEB', '#FF9F1C', '#D90368', '#7F96FF', '#A30B37', '#EF233C'].freeze

  belongs_to :topic, required: false
  has_and_belongs_to_many :notes

  validates :name, uniqueness: true
  validate :not_a_language
  validate :not_own_subtopic

  scope :names, -> { all.pluck(:name) }

  def initialize(attributes = {})
    super
    self.display_color = DISPLAY_COLORS.sample
  end

  private

  def not_a_language
    language_names = Language.possible_names.map(&:downcase)
    errors.add(:name, 'name cannot be a programming language') if name && language_names.include?(name.downcase)
  end

  def not_own_subtopic
    errors.add(:topic, 'cannot be its own subtopic') if topic == self
  end
end
