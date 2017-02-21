class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def dashboard
  end
  
  def index
    @doctors = Doctor.all.creation
  end
  
  def update_specialist
    @doctors = Doctor.where("specialist = ?", params[:specialist]).creation
  end

  def all_patient_list
    doctor = Doctor.find_by(id: params[:id])
    @patients = doctor.patients.creation.distinct
  end

  def show
  end

  def new
    @doctor = Doctor.new
  end

  def edit
  end

  def create
  
    @doctor = Doctor.new(doctor_params)
    respond_to do |f|
      @doctor.save
      f.html { redirect_to doctors_url}
      f.js   { redirect_to doctors_url, notice: 'Doctor was successfully created.'  }
    end
  end

  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to @doctor, notice: 'Doctor was successfully updated.' }
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render :edit }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @doctor.destroy
    respond_to do |format|
      format.html { redirect_to doctors_url, notice: 'Doctor was successfully destroyed.' }
      format.json { head :no_content }
      format.js { render :layout => false } 
    end
  end

  private
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    def doctor_params
      params.require(:doctor).permit(:firstname, :lastname, :gender, :city, :state, :contact_no, :specialist, :practice_from,:profile_picture)
    end
end
