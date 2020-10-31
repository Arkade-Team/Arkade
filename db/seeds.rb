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

=begin
n = 0
20.times do
  n = n + 1
  i = rand(1..15)
  k = 1
  Wiki.create(name: ("Wiki "+ n.to_s.rjust(3,'0')), readingtime: Date.current)
  i.times do
    Tab.create(
      wiki_id: n,
      title: ("Title " + n.to_s.rjust(3,'0') + "." + k.to_s.rjust(3,'0')), 
      body:  ("Body "  + n.to_s.rjust(3,'0') + "." + k.to_s.rjust(3,'0')) 
    )
    k = k + 1
  end
end
=end

diseases = [osteo, depre, hiv]

1000.times do
  appointment = Appointment.create({
    age: Random.new.rand(0..100),
    sex: ["male", "female"].sample
  })

  n_diseases = (rand * 3).floor + 1
  diseases.shuffle[0...n_diseases].each do |disease|
    appointment.diseases << disease
  end
end

n = Appointment.count
i = 0
n.times do
  i = i + 1
  appointment = Appointment.find_by(id: i)
  data = ((0..120).to_a.sample.days.ago) + (i * 3600)
  appointment.update(created_at: data)
end
