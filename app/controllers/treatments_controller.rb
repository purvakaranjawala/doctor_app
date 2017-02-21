class TreatmentsController < ApplicationController
  before_action :set_treatment, only:[ :delete]
 
  def index
    @treatments = Treatment.all
  end
  
  def show
    @treatment = Treatment.doctor_treatment(params[:id])
    if @treatment.empty?
      redirect_to :back, notice: "not provided treatment now"
    else
      @treatment =  Treatment.find_by(disease_info_id: params[:id])
    end
  end

  def new
    disease_info = DiseaseInfo.find_by(id: params[:disease_info])
    if disease_info.treatment.blank?
      @treatment = Treatment.new      
    else
      redirect_to :back, notice: "Treatment already provided"
    end
  end

  def create 
    disease_info = DiseaseInfo.find_by(id: params[:treatment][:disease_info_id])
    @treatment = disease_info.build_treatment(params_treatment)
    # @treatment = disease_info.create_treatment(params_treatment)
    if @treatment.save
      redirect_to doctors_path
    else
      render 'new'
    end
  end
  

  def edit
    disease_info = DiseaseInfo.find(params[:id])
    @treatment = disease_info.treatment
  end

  def update
    @treatment = Treatment.find(params[:id])
    respond_to do |format|
      if @treatment.update(params_treatment)
        format.html { redirect_to @treatment, notice: 'Treatment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def delete
    @treatment.destroy
    respond_to do |format|
      format.html { redirect_to treatments_url, notice: 'treatment was successfully destroyed.' }
    end
  end

  private 

  def set_treatment
    @treatment = Treatment.find(params[:id]) 
  end

  def params_treatment
    params.require(:treatment).permit(:disease_name,:next_checkup,:medication,:testing,:precaution,:dose_period,:fees,:disease_info_id)
  end

end
