module DiseaseInfosHelper
  def doctor_name(disease_info)
    doctor = disease_info.doctor
    doctor ? doctor.firstname : ''
  end
end
