# frozen_string_literal: true

# Active Recrod Model that represents a snippet of code attached to a note.
class CodeSnippet < ApplicationRecord
  belongs_to :note
end
