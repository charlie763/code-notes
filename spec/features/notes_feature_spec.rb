require 'rails_helper'

RSpec.describe "Notes feature", type: :feature do
  context "new note" do
    it "creates a new note given valid params" do
      visit new_user_note_path(1)
     
      fill_in('note[title]', with: "Test Title")
      fill_in('note[summary]', with: "test note summary")
      fill_in('note[language_attributes][name]', with: "Python")      
      fill_in('note[topics_attributes][0][name]', with: "test topic name")
      fill_in('note[code_snippets_attributes][0][code]', with: "<p>test code</p>")
      fill_in('note[code_snippets_attributes][0][annotation]', with: "that's what a paragraph tag looks") 
      click_button("Create Note")
      #visit ''
    end
  end
  
  # context "search" do
  #   before(:each) do
  #     visit '/notes'
  #   end

  #   it "allows user to search for notes by language filters notes accordingly" do
  #     # fill_in('terms[language]', with: "Ruby")
  #     # click_button("Search")
  #     #expect all notes on page to have the "Ruby" language tag
  #   end

  #   it "allows user to search for notes by topic" do

  #   end

  #   it "allows user to search for notes by keyword, which looks for keyword in title and description attributes" do

  #   end

  #   it "allows user to search by multiple categories" do

  #   end

  # end

end