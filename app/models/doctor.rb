class Doctor < ApplicationRecord
	has_many :disease_infos, dependent: :destroy
	has_many :patients, through: :disease_infos
	has_many :treatments, through: :disease_infos
  has_attached_file :profile_picture, :styles => { :medium => "300x300#", :thumb => "100x100#" }
  validates_attachment_content_type :profile_picture, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
