class Treatment < ApplicationRecord
	belongs_to :disease_info
	scope :doctor_treatment, ->(id) { where("disease_info_id = ?",id)}
end
