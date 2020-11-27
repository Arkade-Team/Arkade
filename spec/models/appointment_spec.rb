require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe "validation" do
    before(:each) do
      @appointment = Appointment.new
    end

    it "fails to create without sex" do
      @appointment.age = 42
      expect(@appointment).not_to be_valid
    end

    it "fails to create without age" do
      @appointment.sex = "female"
      expect(@appointment).not_to be_valid
    end

    it "fails to create when age is not number" do
      @appointment.age = "quarenta e dois"
      @appointment.sex = "female"
      expect(@appointment).not_to be_valid
    end

    it "fails to create when sex isn't exactally male or female" do
      @appointment.age = 42
      @appointment.sex = "male anything"
      expect(@appointment).not_to be_valid
    end

    it "accepts ' MALE ' as a valid sex" do
      @appointment.age = 42
      @appointment.sex = " MALE "

      expect(@appointment).to be_valid
    end
    
    it "accepts ' FEMALE ' as a valid sex" do
      @appointment.age = 37
      @appointment.sex = " FEMALE "

      expect(@appointment).to be_valid
    end
  end

  describe "query methods" do
    before(:each) do
      Appointment.delete_all
      @valid_period_date = 4.days.ago
    end

    describe "general aspects of methods" do
      methods = %i[age_distribution sex_per_last_period
        appointments_per_disease appointments_per_disease_rank appointments_per_disease_raras diseases_per_age sex_per_diseases
        sex_distribution appointments_per_day_period]

      methods.each do |method|
        it "is defined" do
          expect(Appointment).to respond_to(method)
        end
      end

      parameterized_methods = %i[sex_per_last_period
        appointments_per_disease appointments_per_disease_rank appointments_per_disease_raras appointments_per_day_period]

      parameterized_methods.each do |method|
        it "requires a date parameter prior to tomorrow" do
          expect { Appointment.send(method) }.
            to raise_error(ArgumentError)
          expect { Appointment.send(method, (Time.now + 2.days)) }.
            to raise_error(ArgumentError)

          expect { Appointment.send(method, Time.now) }.
            not_to raise_error
        end
      end
    end

    describe "age_distribution" do
      it "always returns a Hash" do
        expect(Appointment.age_distribution).to be_a(Hash)

        Appointment.create([
          { sex: "male", age: 40 },
          { sex: "female", age: 80 },
          { sex: "male", age: 60 },
        ])

        expect(Appointment.age_distribution).to be_a(Hash)
      end

      it "returns an empty hash when there is no data" do
        expect(Appointment.age_distribution).to eql({})
      end

      it "return the correct counting when there is data" do
        Appointment.create([
          { age: 40, sex: "male" },
          { age: 45, sex: "female" },
          { age: 40, sex: "female" },
        ])
        expect(Appointment.age_distribution).to eql({ 40 => 2, 45 => 1 })
      end
    end

    describe "sex_per_last_period" do
      it "returns an empty hash when no data is present" do
        expect(Appointment.sex_per_last_period(@valid_period_date)).to eql({})
      end

      it "return correct counts when there is data" do
        the_counts = {
          ["male", 3.days.ago.to_date] => 1,
          ["female", 3.days.ago.to_date] => 1,
          ["female", 2.days.ago.to_date] => 1,
        }

        Appointment.create([
          { sex: "male", age: 40, created_at: 3.days.ago },
          { sex: "female", age: 62, created_at: 3.days.ago },
          { sex: "female", age: 37, created_at: 2.days.ago },
        ])

        expect(Appointment.sex_per_last_period(@valid_period_date)).to eql(the_counts)
      end
    end

    describe "appointments_per_disease" do
      it "returns an empty hash when there is no data" do
        expect(Appointment.appointments_per_disease(@valid_period_date)).to eql({})
      end

      it "returns the correct counts when there is data" do
        osteo = "Osteoporose"
        day = 2.days.ago

        the_counts = { [osteo, day.to_date] => 1 }

        Disease.delete_all
        app = Appointment.create(sex: "female", age: 64, created_at: day)
        app.diseases << Disease.create(name: osteo)
        expect(Appointment.appointments_per_disease(@valid_period_date)).to eql(the_counts)
      end
    end

    describe "diseases_per_age" do
      it "returns an empty hash when there is no data" do
        expect(Appointment.diseases_per_age).to eql({})
      end

      it "return the correct counts when there is data" do
        osteo = "Osteoporose"
        depre = "Depressão"        
        Disease.delete_all
        d_osteo = Disease.create(name: osteo)
        d_depre = Disease.create(name: depre)
        app = Appointment.create( age: 64, sex: "female" )
        app.diseases << d_osteo << d_depre
        app = Appointment.create( age: 64, sex: "female" )
        app.diseases << d_osteo
        app = Appointment.create( age: 42, sex: "male" )
        app.diseases << d_depre
        app = Appointment.create( age: 42, sex: "female" )
        app.diseases << d_depre
        app = Appointment.create( age: 42, sex: "male" )
        app.diseases << d_depre
        app = Appointment.create( age: 42, sex: "female" )
        app.diseases << d_depre

        the_counts = {
          [osteo, 64] => 2,
          [depre, 64] => 1,
          [depre, 42] => 4,
        }

        expect(Appointment.diseases_per_age).to eql(the_counts)
      end
    end

    describe "sex_per_diseases" do
      it "returns an empty hash when there is no data" do
        expect(Appointment.sex_per_diseases).to eql({})
      end

      it "return the correct counts when there is data" do
        osteo = "Osteoporose"
        depre = "Depressão"
        
        Disease.delete_all
        d_osteo = Disease.create(name: osteo)
        d_depre = Disease.create(name: depre)
        app = Appointment.create( age: 64, sex: "female" )
        app.diseases << d_osteo << d_depre
        app = Appointment.create( age: 64, sex: "female" )
        app.diseases << d_osteo
        app = Appointment.create( age: 42, sex: "male" )
        app.diseases << d_depre
        app = Appointment.create( age: 42, sex: "female" )
        app.diseases << d_depre
        app = Appointment.create( age: 42, sex: "male" )
        app.diseases << d_depre
        app = Appointment.create( age: 42, sex: "female" )
        app.diseases << d_depre

        the_counts = {
          ["female", osteo] => 2,
          ["female", depre] => 3,
          ["male", depre] => 2,
        }
        expect(Appointment.sex_per_diseases).to eql(the_counts)
      end
    end

    describe "sex_distribution" do
      it "returns an empty hash when there is no data" do
        expect(Appointment.sex_distribution).to eql({})
      end

      it "returns the correct counts when there is data" do
        the_counts = {
          "male" => 4,
          "female" => 2
        }

        Appointment.create([
          { sex: "male", age: (20..70).to_a.sample },
          { sex: "male", age: (20..70).to_a.sample },
          { sex: "male", age: (20..70).to_a.sample },
          { sex: "male", age: (20..70).to_a.sample },
          { sex: "female", age: (20..70).to_a.sample },
          { sex: "female", age: (20..70).to_a.sample },
        ])

        expect(Appointment.sex_distribution).to eql(the_counts)
      end
    end

    describe "appointments_per_day_period" do
      describe "return value" do
        before(:each) do
          batch = []
          
          (1..3).each do |d|
            [4, 8, 10, 16, 20].each do |h|
              batch << {
                age: 41,
                sex: "male",
                created_at: d.days.ago.midnight + h.hours }
            end
          end

          Appointment.create(batch)
          @appointments_per_day_period = Appointment.
            appointments_per_day_period @valid_period_date
        end

        it "returns an array" do
          expect(@appointments_per_day_period).to be_an(Array)
        end

        it "returns an array with an array and a hash" do
          array_candidate, hash_candidate = @appointments_per_day_period
          expect(array_candidate).to be_an(Array)
          expect(hash_candidate).to be_an(Hash)
        end

        it "counts correctly the total amounts for period" do
          counts = @appointments_per_day_period[1]
          expected = {
            madrugada: 3, manha: 6, tarde: 3, noite: 3
          }
          expect(counts).to eql(expected)
        end

        it "distributes correctly the appointments into period" do
          counts =
            @appointments_per_day_period[0].select { |v| v.is_a? Integer }
          expect(counts).to eql([1, 2, 1, 1] * 3)
        end
      end
    end
    describe "appointments_per_disease_rank" do
      it "returns an empty hash when there is no data" do
        expect(Appointment.appointments_per_disease_rank(@valid_period_date)).to eql({})
      end

      it "returns the correct counts when there is data" do
        hiv = "HIV"
        day = 2.days.ago
        the_counts = { hiv => 1}
        Disease.delete_all
        app = Appointment.create(sex: "male", age: 54, created_at: day)
        app.diseases << Disease.create(name: hiv)
        expect(Appointment.appointments_per_disease_rank(@valid_period_date)).to eql(the_counts)
      end
    end
  end
end
