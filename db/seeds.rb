# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Creación usuario ADMIN y usuario VET de pruebas

user_admin = User.new(email: "admin@gatito.cl", password: "123456", password_confirmation: "123456", role: "admin")
user_admin.save!

user_vet = User.new(email: "veterinario@gatito.cl", password: "123456", password_confirmation: "123456", role: "vet")
user_vet.save!

user_client = User.new(email: "cliente@gatito.cl", password: "123456", password_confirmation: "123456")
user_client.save!