# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:user) do
    User.create(
      username: 'RspecUser',
      password: 'password',
      email: 'test@test.com'
    )
  end

  let(:language) {Language.find_or_create_by(name: 'Ruby')}

  let(:note) do
    Note.create(
      title: 'Note1',
      summary: 'Summary' + 'lorem ipsum doler ' * rand(5..20),
      user: user,
      language: language
    )
  end

  let(:topic1) do
    note.topics.create(
      name: 'Rspec Topic1'
    )
  end

  let(:languages) {Language.possible_names}

  it 'saves if attributes are valid' do
    topic = Topic.new(name: 'Rspec Topic2')
    topic.notes << note
    topic.save
    expect(topic).to be_valid
  end

  it 'cannot have a name that is also the name of a language' do
    topic1.update(name: languages.sample)
    expect(topic1).not_to be_valid
  end
end
