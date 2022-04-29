# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Creación usuario ADMIN y usuario VET de pruebas

user_admin = User.create!(email: "admin@gatito.cl", password: "123456", password_confirmation: "123456", role: "admin")
user_vet = User.create!(email: "veterinario@gatito.cl", password: "123456", password_confirmation: "123456", role: "vet", likes: 10)
user_vet_practicante = User.create!(email: "practicante@gatito.cl", password: "123456", password_confirmation: "123456", role: "vet", likes: 4)
user_client = User.create!(email: "cliente@gatito.cl", password: "123456", password_confirmation: "123456")

# Creación de mascotas de usuario testing
20.times do
    species = ["dog", "cat"].sample

    if species == "dog"
        new_pet = Pet.new(
            name: Faker::Creature::Dog.name, 
            age: (rand() * 10).to_i, 
            weight: (rand() * 4).round(1),
            species: "dog",
            race: Faker::Creature::Dog.breed,
            created_at: rand(1.months).seconds.ago
        )
    else
        new_pet = Pet.new(
            name: Faker::Creature::Cat.name, 
            age: (rand() * 10).to_i, 
            weight: (rand() * 4 + 1).round(1),
            species: "cat",
            race: Faker::Creature::Cat.breed,
            created_at: rand(1.months).seconds.ago
        )
    end

    user_client.pets << new_pet
    new_pet.save

    new_appointment = Appointment.new(date: rand(1.months).seconds.ago)
    new_pet.appointments << new_appointment
    [user_vet, user_vet_practicante].sample.appointments << new_appointment

end