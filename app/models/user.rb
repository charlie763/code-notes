class User < ApplicationRecord
  has_secure_password
  has_many :notes
  has_many :external_resources
  has_many :topics, through: :notes
  has_many :languages, through: :notes

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
end
