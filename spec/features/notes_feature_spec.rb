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

    it "can add an external resource via new notes" do
      find_field('note_title').set("Test Title")
      fill_in('note[summary]', with: "test note summary")
      fill_in('note[language_attributes][name]', with: "Python")      
      fill_in('note[topics_attributes][0][name]', with: "test topic name")
      fill_in('note[external_resources_attributes][0][name]', with: "Rspec Resource Name")
      fill_in('note[external_resources_attributes][0][url]', with: "Rspec@rspec.com")
      fill_in('note[external_resources_attributes][0][description]', with: "Rspec Resource description")
      click_button("Save")
      
      expect(page).to have_text("Rspec Resource Name")
      expect(page).to have_text("Rspec@rspec.com")
      expect(page).to have_text("Rspec Resource description")
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

  context "update note" do
    it "updates the external resource when edits are made" do
      visit edit_note_path(1)
      fill_in('note[external_resources_attributes][0][name]', with: "Rspec Resource Name")
      fill_in('note[external_resources_attributes][0][url]', with: "Rspec@rspec.com")
      fill_in('note[external_resources_attributes][0][description]', with: "Rspec Resource description")
      click_button("Save")
      
      expect(page).to have_text("Rspec Resource Name")
      expect(page).to have_text("Rspec@rspec.com")
      expect(page).to have_text("Rspec Resource description")
    end

    it "doesn't create a new external resource instead of updating the existing one" do
      initial_external_resources_length = ExternalResource.all.length
      visit edit_note_path(1)
      fill_in('note[external_resources_attributes][0][name]', with: "Rspec Resource Name")
      fill_in('note[external_resources_attributes][0][url]', with: "Rspec@rspec.com")
      fill_in('note[external_resources_attributes][0][description]', with: "Rspec Resource description")
      click_button("Save")
      
      expect(ExternalResource.all.length).to eq(initial_external_resources_length)
    end
  end

  context "delete note" do
    before(:each){
      visit note_path(1)
      click_button("Delete")
    }

    let(:associated_code){Note.find(1).code_snippets.pluck(:id)}
    let(:associated_resources){Note.find(1).external_resources.pluck(:id)}
    let(:associated_language){Note.find(1).language.id}
    let(:associated_topics){Note.find(1).topics.pluck(:id)}

    it "deletes a note" do
      expect(Note.find_by(id: 1)).to be_nil
    end

    it "deletes associated code_snippets" do
      associated_code.each do |snippet_id|
        expect(CodeSnippet.find_by(id: snippet_id).to be_nil
      end
    end

    it "deletes associated external resource" do
      associated_resources.each do |resource_id|
        expect(ExternalResource.find_by(id: resource_id).to be_nil
      end
    end

    it "does not delete associated language" do
      expect(Langauge.find_by(id: associated_language)).to exist
    end

    it "does note delete an associated topic" do
      associated_topics.each do |topic_id|
        expect(Topic.find_by(id: topic_id)).to exist
      end
    end
  end

end