# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Favorite.create([
  {source: "cnn", user_id: 1},
  {source: "buzzfeed", user_id: 1},
  {source: "techcrunch", user_id: 2},
  {source: "washingtonpost", user_id: 2},
  {source: "msnbc", user_id: 3}
])
