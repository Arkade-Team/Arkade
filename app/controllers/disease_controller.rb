class DiseaseController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  before_action :set_appointment, only: [:create]

  def index
    @diseases = Disease.all
    @related_diseases = Disease.related_pairs
  end

  def create
    names = params[:diseases]
    @diseases = names.map { |name| get_by_name_or_create(name["name"]) }
    @diseases.each { |disease| @appointment.diseases << disease }
    render json: @diseases
  end

  private

    def get_by_name_or_create(name)
      Disease.find_by_name(name) || Disease.create(name: name)
    end

    def set_appointment
      p_id = params[:appointment_id]
      @appointment = Appointment.find_by_id p_id
      puts "p_id #{p_id}"
      if @appointment.nil?
        render json: { error: "appointment #{p_id} not found" }
      end
      @appointment
    end
end
