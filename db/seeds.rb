# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
osteo = Disease.create([{ name: "Osteoporose" }])

20.times do
  appointment = Appointment.create({
    age: Random.new.rand(0..100),
    sex: ["male", "female"].sample
  })

  appointment.diseases << osteo
end
