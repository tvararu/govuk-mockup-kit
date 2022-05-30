# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

journey = Journey.create! title: "Apply for a juggling licence"
journey.pages.tap do |p|
  p.create! title: "What is your name?"
  p.create! title: "Where did you learn to juggle?"
  p.create! title: "What is your address?"
end
