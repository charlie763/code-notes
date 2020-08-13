require 'rails_helper'

RSpec.describe Note, type: :model do
  let(:ruby_notes){Note.joins(:language).where(languages: {name: "Ruby"})}
  let(:swift_notes){Note.joins(:language).where(languages: {name: "Swift"})}
  let(:topic_notes){Note.joins(:topics).where('topics.name LIKE ?', "%1%")}

  context "search method" do
    it "returns correct search results when searching for notes by language" do
      results = Note.search({language: "Ruby"})
      expect(results).to eq(ruby_notes)
    end

    it "returns correct search results when searching for notes by topic" do
      results = Note.search({topic: "1"})
      expect(results).to eq(topic_notes)
    end

    it "returns the correct results when searching by language and topic" do
      results = Note.search({language: "Swift", topic: "1"})
      expect(swift_notes).to include(results.first)
      expect(topic_notes).to include(results.first)
    end
  end
end
