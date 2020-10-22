# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
osteo = Disease.create([{ name: "Osteoporose" }])

1000.times do
  appointment = Appointment.create({
    age: Random.new.rand(0..100),
    sex: ["male", "female"].sample
  })

  appointment.diseases << osteo
end

n = Appointment.count
i = 0
n.times do
  i = i + 1
  appointment = Appointment.find_by(id: i)
  data = ((0..120).to_a.sample.days.ago) + (i * 3600)
  appointment.update(created_at: data)
end
