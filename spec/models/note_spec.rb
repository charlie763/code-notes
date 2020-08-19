require 'rails_helper'

RSpec.describe Note, type: :model do
  let(:ruby_notes){Note.joins(:language).where(languages: {name: "Ruby"})}
  let(:python_notes){Note.joins(:language).where(languages: {name: "Python"})}
  let(:topic_notes){Note.joins(:topics).where('topics.name LIKE ?', "%1%")}
  let(:current_user){User.first}

  context "search method" do
    it "returns correct search results when searching for notes by language" do
      results = Note.search({language: "Ruby"}, current_user)
      expect(results.pluck(:id)).to eq(ruby_notes.pluck(:id))
    end

    it "returns correct search results when searching for notes by topic" do
      results = Note.search({topic: "1"}, current_user)
      expect(results.pluck(:id)).to eq(topic_notes.pluck(:id))
    end

    it "returns the correct results when searching by language and topic" do
      results = Note.search({language: "Python", topic: "1"}, current_user)
      expect(python_notes.pluck(:id)).to include(results.pluck(:id).first)
      expect(topic_notes.pluck(:id)).to include(results.pluck(:id).first)
    end
  end
end
