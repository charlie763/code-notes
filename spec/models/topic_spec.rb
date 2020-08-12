require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:note){Note.create(
    title: "Note1",
    summary: "Summary" + "lorem ipsum doler "*(rand(5..20)),
    user_id: User.select(:id).map{|u| u.id}.sample,
    language_id: Language.select(:id).map{|u| u.id}.sample
  )}
  
  let(:topic1) {note.topics.create(
    name: "Topic1", 
    topic_type: "general"
    )
  }

  let(:languages) {Language.select(:name).map{|language| language.name}}

  it "saves if attributes are valid" do
    topic = note.topics.build(name: "Topic2", topic_type: "subtopic")
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

#type must be "subtopic" if topic_id is present

end
