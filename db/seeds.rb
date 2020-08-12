# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#users
users_attributes = [
    {username: "Charlie", email: "cwisoff@gmail.com", password: "test"},
    {username: "User2", email: "test@test.com", password: "test2"},
    {username: "Daniel", email: "test@test.com", password: "test3"},
    {username: "Eva", email: "test@test.com", password: "test4"},
    {username: "Jason", email: "test@test.com", password: "test5"},
    {username: "Jinaabah", email: "test@test.com", password: "test6"}
  ]

users_attributes.each do |attribute_hash| 
  User.create(attribute_hash) unless User.find_by(username: attribute_hash[:username])
end

#topics
topics_attributes = (1..10).map{|num| {
    name: "Topic#{num}", 
    topic_id: [1,2,3,nil,nil,nil].sample, 
    topic_type: ["general", "subtopic", "use case", "gem", "library", "web framework", "DSL"].sample
  }
}

topics_attributes.each do |attr_hash| 
  Topic.create(attr_hash) unless Topic.find_by(name: attr_hash[:name])
end

#languages
languages = ["Ruby", "Python", "JavaScript", "C", "Swift"]
languages.each{|l| Language.create(name: l)}

#notes
notes_attributes = (1..50).each do |num|
  Note.create(
    title: "Note#{num}",
    summary: "Summary" + "lorem ipsum doler "*(rand(5..20)),
    public: [true, false].sample,
    user_id: User.select(:id).map{|u| u.id}.sample,
    language_id: Language.select(:id).map{|u| u.id}.sample
  )
end

#external resources
ExternalResource.create(name: "google", url: "google.com")
ExternalResource.create(name: "Duck Duck go", url: "duckduckgo.com")

#resource subsection

#code snippet
