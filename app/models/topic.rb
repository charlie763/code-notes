class Topic < ApplicationRecord
  belongs_to :topic, required: false
  has_and_belongs_to_many :notes

  validates :name, presence: true
  validate :not_a_language
  validate :not_own_subtopic

  private
  def not_a_language
    language_names = Language.possible_names.map{|name| name.downcase}
    if name && language_names.include?(name.downcase)
      errors.add(:name, "name cannot be a programming language")
    end
  end

  def not_own_subtopic
    if self.topic == self
      errors.add(:topic, "cannot be its own subtopic")
    end
  end

end
