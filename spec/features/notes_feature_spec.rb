require 'rails_helper'

RSpec.describe "Notes feature", type: :feature do
  before(:each){page.set_rack_session(user_id: 1)}
  
  context "new note" do
    before(:each){visit new_note_path}
    it "creates a new note given valid params" do
      find_field('note_title').set("Test Title")
      fill_in('note[summary]', with: "test note summary")
      fill_in('note[language_attributes][name]', with: "Python")      
      fill_in('note[topics_attributes][0][name]', with: "test topic name")
      fill_in('note[code_snippets_attributes][0][code]', with: "<p>test code</p>")
      fill_in('note[code_snippets_attributes][0][annotation]', with: "that's what a paragraph tag looks") 
      click_button("Save")
      
      expect(page).to have_text("Test Title")
      expect(page).to have_text("test note summary")
      expect(page).to have_text("Python")
      expect(page).to have_text("test topic name")
      expect(page).to have_text("<p>test code</p>")
      expect(page).to have_text("that's what a paragraph tag looks")
    end

    it "throws an error if the title is blank" do
      fill_in('note[language_attributes][name]', with: "Python")      
      fill_in('note[topics_attributes][0][name]', with: "test topic name")
      click_button("Save")
      
      expect(page).to have_text("Title can't be blank")
    end

    it "throws an error if the language doesn't match an existing language" do
      fill_in('note[language_attributes][name]', with: "Charlie's Language")
      click_button("Save")

      expect(page).to have_text("Language must be a software development language")
    end

    it "doesn't create a code_snippet if code snippet fields left blank" do
      initial_code_snippets_length = CodeSnippet.all.length
      find_field('note_title').set("Test Title")
      fill_in('note[summary]', with: "test note summary")
      fill_in('note[language_attributes][name]', with: "Python")      
      fill_in('note[topics_attributes][0][name]', with: "test topic name")
      click_button("Save")
      expect(CodeSnippet.all.length).to eq(initial_code_snippets_length)
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