# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

team1 = Team.create!(name: "Manchester United", year_founded: 1902, former_champion: true)
team2 = Team.create!(name: "Liverpool", year_founded: 1892, former_champion: true)
player1 = team1.players.create!(name: "David Beckham", position: "Midfielder", age: 48, retired: true)
player2 = team2.players.create!(name: "Virgil Van Dijk", position: "Defender", age: 32, retired: false)
player3 = team1.players.create(name: "Marcus Rashford", position: "Midfielder", age: 25, retired: false)