class DoctorsController < ApplicationController
  before_action :find_user, only [:show, :destroy]
  
  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to @doctor
    else 
      render :new
    end 
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end
  
  def update
    @doctor = Doctor.find(params[:id])
    if (@doctor.update(doctors_params))
      redirect_to @doctor
    else
      render :edit
    end
  end
  
  def show
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_path
  end 

  private
  def find_user
    @doctor = Doctor.find(params[:id])
  end 

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name)
  end 
end
