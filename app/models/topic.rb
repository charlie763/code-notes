class Topic < ApplicationRecord
  DISPLAY_COLORS = ["#EFBDEB", "#FF9F1C","#D90368", "#7F96FF", "#A30B37","#EF233C"]

  belongs_to :topic, required: false
  has_and_belongs_to_many :notes

  validates :name, uniqueness: true
  validate :not_a_language
  validate :not_own_subtopic

  scope :names, -> {all.pluck(:name)}

  def initialize(attributes = {})
    super
    self.display_color = DISPLAY_COLORS.sample
  end
  
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
