class ExternalResource < ApplicationRecord
  belongs_to :language
  belongs_to :user
end
