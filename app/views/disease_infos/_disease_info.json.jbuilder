json.extract! disease_info, :id, :symptoms, :doctor_id, :patient_id, :symptom_time, :patient_type, :created_at, :updated_at
json.url disease_info_url(disease_info, format: :json)