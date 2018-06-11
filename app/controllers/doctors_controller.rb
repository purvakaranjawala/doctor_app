class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def dashboard
  end

  def index
    @doctors = Doctor.all.creation
  end

  def update_specialist
    return unless params[:specialist]
    @doctors = specialist_doctor(params[:specialist]).creation
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
    respond_to do |format|
      if @doctor.save
        format.html { redirect_to doctors_url }
        format.js { redirect_to doctors_url, notice: 'Doctor was successfully created.' }
      else
        format.html { render :new, notice: 'Doctor not saved' }
      end
    end
  end

  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html do
          redirect_to @doctor, notice: 'Doctor was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render :edit }
        format.json do
          render json: @doctor.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def update_cities
    @cities = City.where('state_id = ?', params[:state_id])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @doctor.destroy
    respond_to do |format|
      format.html do
        redirect_to doctors_url, notice: 'Doctor was successfully destroyed.'
      end
      format.json { head :no_content }
      format.js do
        render layout: false
      end
    end
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(
      :firstname,
      :lastname,
      :gender,
      :city,
      :state,
      :contact_no,
      :specialist,
      :practice_from, :profile_picture
    )
  end
end
