require 'rails_helper'

RSpec.describe "Notes feature", type: :feature do
  context "search" do
    before(:each) do
      visit '/notes'
    end

    it "allows user to search for notes by language filters notes accordingly" do
      # fill_in('terms[language]', with: "Ruby")
      # click_button("Search")
      #expect all notes on page to have the "Ruby" language tag
    end

    it "allows user to search for notes by topic" do

    end

    it "allows user to search for notes by keyword, which looks for keyword in title and description attributes" do

    end

    it "allows user to search by multiple categories" do

    end

  end

end