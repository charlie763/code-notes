require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:user){User.create(
    username: "RspecUser",
    password: "password",
    email: "test@test.com"
  )}

  let(:language){Language.find_or_create_by(name: "Ruby")}

  let(:note){Note.create(
    title: "Note1",
    summary: "Summary" + "lorem ipsum doler "*(rand(5..20)),
    user: user,
    language: language
  )}

  let(:topic1) {
    note.topics.create(
    name: "Rspec Topic1"
    )
  }

  let(:languages) {Language.possible_names}

  it "saves if attributes are valid" do
    topic = note.topics.build(name: "Rspec Topic2")
    topic.topic = topic1
    topic.save
    expect(topic).to be_valid
  end

  it "cannot have a name that is also the name of a language" do
    topic1.update(name: languages.sample)
    expect(topic1).not_to be_valid
  end
  
  it "can't be a subtopic to itself" do
    topic1.update(topic_id: topic1.id)
    expect(topic1).not_to be_valid
  end

end
