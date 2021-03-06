# frozen_string_literal: true

# Active Record Model representing the users of the application. Oauth creation of user possible.
class User < ApplicationRecord
  has_secure_password
  has_many :notes
  has_many :external_resources
  has_many :topics, through: :notes
  has_many :languages, through: :notes

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, if: -> { email }
  validates :username, presence: true, uniqueness: true, unless: -> { github_email }
  validates :password, presence: true
  validate :multiple_email_validation

  def self.username_if_not_taken(omniauth_username)
    all.pluck(:username).include?(omniauth_username) ? nil : omniauth_username
  end

  private

  def multiple_email_validation
    if !github_email && !email.present?
      errors.details[:email] = [{ error: "can't be blank" }]
      errors.messages[:email] = ["can't be blank"]
    end
  end
end
