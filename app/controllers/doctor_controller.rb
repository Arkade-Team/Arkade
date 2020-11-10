class DoctorController < ApplicationController
  def index
    @doctors = ::Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      redirect_to @doctor
    else
      render 'new'
    end
  end

  def update
    @doctor = Doctor.find(params[:id])

    if @doctor.update(doctor_params)
      redirect_to @doctor
    else
      render 'edit'
    end
  end
    
  def show
    @doctor = Doctor.find(params[:id])
  end

  private
  def doctor_params
    params.require(:doctor).permit(:crm, :name, :specialty)
  end

end
