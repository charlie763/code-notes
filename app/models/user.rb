class User < ApplicationRecord
  has_secure_password
  has_many :notes
  has_many :external_resources
  has_many :topics, through: :notes
  has_many :languages, through: :notes

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, if: -> {email} 
  validates :username, presence: true, uniqueness: true, unless: -> {github_email}
  validates :password, presence: true
  validate :multiple_email_validation

  def self.username_if_not_taken(omniauth_username)
    self.all.pluck(:username).include?(omniauth_username) ? nil : omniauth_username
  end

  private
  def multiple_email_validation
    errors.add(:email, "must have an email address") if !email && !github_email
  end
end
