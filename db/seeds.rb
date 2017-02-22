# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
State.delete_all
puts "States deleted"
City.delete_all
puts "Citys deleted"

State.create!([
  {id: 1, name: "Madhya Pradesh" },
  {id: 2, name: "Maharashtra"},
  {id: 3, name: "Rajasthan"},
  {id: 4, name: "Uttar Pradesh"},
  {id: 5, name: "Chattisgarh"}
])

City.create!([
  {id: 1, state_id: 1, name: "indore" },
  {id: 2, state_id: 1, name: "gwalior" },
  {id: 3, state_id: 2, name: "Mumbai"},
  {id: 4, state_id: 2, name: "Pune"},
  {id: 5, state_id: 3, name: "jaipur" },
  {id: 6, state_id: 4, name: "agra" },
  {id: 7, state_id: 4, name: "lucknow" },
  {id: 8, state_id: 5, name: "Raipur" },
  {id: 9, state_id: 1, name: "jabalpur" }
])


