class HospitalsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  # GET /hospitals
  # GET /hospitals.json
  def index
    @hospitals = Hospital.all
  end

  # GET /hospitals/1/appointments
  # GET /hospitals/1/appointments.json
  def appointments
    @hospital = Hospital.find(params[:hospital])
  end

  # GET /hospitals/new
  def new
    @hospital = Hospital.new
  end

  # POST /hospitals
  # POST /hospitals.json
  def create
    @hospital = Hospital.new(hospital_params)

    if @hospital.save
      render json: @hospital
    else
      render json: @hospital.errors
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def hospital_params
      params.require(:hospital).permit(:name)
    end
end