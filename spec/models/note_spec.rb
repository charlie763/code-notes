require 'rails_helper'

RSpec.describe Note, type: :model do
  let(:ruby_notes){Note.joins(:language).where(languages: {name: "Ruby"})}

  context "search method" do
    it "returns correct search results when searching for notes by language" do
      binding.pry
    end
  end
end
