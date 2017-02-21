class DiseaseInfosController < ApplicationController
  before_action :set_disease_info, only: [:show, :edit, :update, :destroy]

  def index
    @disease_infos = DiseaseInfo.list(params[:id]).creation
  end

  def show
  end

  def new
    @patient =  Patient.find_by(id: params[:id])
    @disease_info = @patient.disease_infos.new
  end

  def edit
  end

  def create
    @disease_info = DiseaseInfo.new(disease_info_params)
    respond_to do |format|
      if @disease_info.save
        format.html { redirect_to @disease_info, notice: 'Disease information was successfully created.' }
        format.json { render :show, status: :created, location: @disease_info }
      else
        format.html { render :new }
        format.json { render json: @disease_info.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @disease_info.update(disease_info_params)
        format.html { redirect_to @disease_info, notice: 'Disease information was successfully updated.' }
        format.json { render :show, status: :ok, location: @disease_info }
      else
        format.html { render :edit }
        format.json { render json: @disease_info.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @disease_info.destroy
    respond_to do |format|
      format.html { redirect_to disease_infos_url, notice: 'Disease info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disease_info
      @disease_info = DiseaseInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disease_info_params
      params.require(:disease_info).permit(:symptoms, :doctor_id, :patient_id, :symptom_time, :patient_type)
    end
end
