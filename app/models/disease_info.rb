class DiseaseInfo < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  has_one    :treatment, dependent: :destroy
  scope :list, -> (id) {where("patient_id = ?",id)}
  
end
