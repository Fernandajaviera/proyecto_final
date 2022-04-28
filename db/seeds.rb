# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Creación usuario ADMIN y usuario VET de pruebas

user_admin = User.create(email: "admin@gatito.cl", password: "123456", password_confirmation: "123456", role: "admin")
user_vet = User.create(email: "veterinario@gatito.cl", password: "123456", password_confirmation: "123456", role: "vet")
user_client = User.create(email: "cliente@gatito.cl", password: "123456", password_confirmation: "123456")


# Creación de mascotas de usuario testing
7.times do
    species = ["dog", "cat"].sample

    if species == "dog"
        new_pet = Pet.new(
            name: Faker::Creature::Dog.name, 
            age: (rand() * 10).to_i, 
            weight: (rand() * 4),
            species: "dog",
            race: Faker::Creature::Dog.breed
        )
    else
        new_pet = Pet.new(
            name: Faker::Creature::Cat.name, 
            age: (rand() * 10).to_i, 
            weight: (rand() * 4 + 1),
            species: "cat",
            race: Faker::Creature::Cat.breed
        )
    end

    user_client.pets << new_pet
end