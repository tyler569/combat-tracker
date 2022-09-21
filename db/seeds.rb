# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

u = User.create(username: "Tyler", password: "password", password_confirmation: "password")

c = Combat.create(name: "Combat 1", user: u)

Character.create(user: u, combat: c, name: "u1", initiative: 12, acted: true)
Character.create(user: u, combat: c, name: "u2", initiative: 10)
Character.create(user: u, combat: c, name: "u3", initiative: 8, acted: true)
Character.create(user: u, combat: c, name: "u4", initiative: 5)
Character.create(user: u, combat: c, name: "u5", initiative: 3)
Character.create(user: u, combat: c, name: "u6", initiative: 0)
Character.create(user: u, combat: c, name: "u7", initiative: -3)

