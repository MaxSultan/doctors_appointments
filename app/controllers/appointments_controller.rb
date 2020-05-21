class AppointmentsController < ApplicationController
before_action :set_user, only: [:new, :show]

  def new
    @users = User.all - @doctor.users
    @appointment = @user.appointment.new
  end

  def index
    @appointments = @user.appointment
  end

  def show
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end 

  def appointment_params
    params.require(:appointment).permit(:date_time)
  end 
end
