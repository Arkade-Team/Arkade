# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


osteo = Disease.create([{ name: "Osteoporose" }])
depre = Disease.create([{ name: "Depressão" }])
hiv = Disease.create([{ name: "HIV" }])
diseases = [osteo, depre, hiv]

gym = Action.create(name: "Exercicios físicos", result: "Prevenir a perda óssea", method: 1)
sun = Action.create(name: "Exposição ao Sol ", result: "Vitamina D", method: 1)
advil = Action.create(name: "Advil", result: "Dores em geral", method: 1)
actions = [gym, sun, advil]

1000.times do
  appointment = Appointment.create({
    age: Random.new.rand(0..100),
    sex: ["male", "female"].sample
  })

  n_diseases = (rand * 3).floor + 1
  diseases.shuffle[0...n_diseases].each do |disease|
    appointment.diseases << disease
  end

  # n_actions = (rand * 3).floor + 1
  # actions.shuffle[0...n_actions].each do |action|
    appointment.actions << advil
  # end

end

n = Appointment.count
i = 0
n.times do
  i = i + 1
  appointment = Appointment.find_by(id: i)
  data = (0..120).to_a.sample.days.ago
  appointment.update(created_at: data)
end

n = Appointment.count
i = 0
n.times do
  i = i + 1
  appointment = Appointment.find_by(id: i)
  Prescription.create()
end
