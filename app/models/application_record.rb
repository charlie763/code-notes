# frozen_string_literal: true

# Main Active Record class that all models inherit from
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
