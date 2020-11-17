# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

wiki = Wiki.create(name: "Calculadora FRAX")

wiki.readingtimes << Readingtime.create

def distribution elements_with_counts
  pool = []

  elements_with_counts.each_pair do |element, count|
    count = 0 if count < 0
    pool.append([element] * count)
  end

  pool.flatten
end

def random_date from = Time.new(2020, 8, 1), to = Time.new(2020, 12, 18)
  Time.at(rand(from.to_i..to.to_i))
end

def pick_date
  day = random_date
  day -= (-12..12).to_a.sample.hours
  day -= (-30..30).to_a.sample.minutes

  day
end

def generate_appointments age_distribution, sex_distribution, diseases, m = 400
  n = (m * rand).to_i

  n.times do
    day = pick_date

    age = age_distribution.sample
    sex = sex_distribution.sample

    appointment = Appointment.new
    appointment.created_at = day
    appointment.updated_at = day
    appointment.age = age
    appointment.sex = sex

    appointment.save

    diseases.each { |disease| appointment.diseases << disease }
  end
end

def generate_cross_disease_appointments diseases, m = 100
  age_base = {}
  (0..100).each { |i| age_base[i] = i ** 2 * (-1) + 100 * i }
  cutting_point = (100 * rand).to_i
  sex_base = { "male" => cutting_point, "female" => 100 - cutting_point }

  age_distribution = distribution age_base
  sex_distribution = distribution sex_base

  (1..diseases.size).each do |i|
    diseases.combination(i).each do |combination|
      generate_appointments age_distribution, sex_distribution, combination, m
    end
  end
end


## Appointments with "Osteoporose" only

osteoporose = Disease.create(name: "Osteoporose")

age_base = {}
(0..45).each { |i| age_base[i] = i ** 2 }
(46..65).each { |i| age_base[i] = age_base[45] * (i - 45) }
(66..100).each { |i| age_base[i] = age_base[45] * (100 - i) * 2 }

sex_base = { "male" => 1, "female" => 9 }

age_distribution = distribution age_base
sex_distribution = distribution sex_base

generate_appointments age_distribution, sex_distribution, [osteoporose]


## Appointments with "HIV" only

hiv = Disease.create(name: "HIV")

(0..12).each { |i| age_base[i] = i ** 2 }
(13..35).each { |i| age_base[i] = i ** 2 + (i - 13) * 10 }
(36..60).each { |i| age_base[i] = age_base[35] + (60 - i) }
(61..100).each { |i| age_base[i] = age_base[60] - (60 - i) ** 2 }

sex_base = { "male" => 1, "female" => 1 }

age_distribution = distribution age_base
sex_distribution = distribution sex_base

generate_appointments age_distribution, sex_distribution, [hiv]


## Appointments with "Depressão" only

depressao = Disease.create(name: "Depressão")

(0..18).each { |i| age_base[i] = 4 * i }
(19..60).each { |i| age_base[i] = 0.5 * i + 66.5 }
(61..100).each { |i| age_base[i] = i + 35.5}

sex_base = { "male" => 1, "female" => 1 }

age_distribution = distribution age_base
sex_distribution = distribution sex_base

generate_appointments age_distribution, sex_distribution, [depressao]


## Appointments with multiple diseases

generate_cross_disease_appointments [osteoporose, hiv, depressao]
