json.extract! patient, :id, :firstname, :lastname, :gender, :city, :state, :contact_no, :age, :dob, :created_at, :updated_at
json.url patient_url(patient, format: :json)