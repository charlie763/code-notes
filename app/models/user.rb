class User < ApplicationRecord
  has_secure_password
  has_many :notes
  has_many :external_resources
  has_many :topics, through: :notes
  has_many :languages, through: :notes

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validate :multiple_email_validation

  private
  def multiple_email_validation
    errors.add(:email, "must have an email address") !email && !github_email
  end
end
