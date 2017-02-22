class Doctor < ApplicationRecord
	has_many :disease_infos, dependent: :destroy	
	
	has_many :patients, through: :disease_infos
	
	has_many :treatments, through: :disease_infos
	
  has_attached_file :profile_picture, :styles => { :medium => "300x300#", :thumb => "100x100#" }
  
  validates_attachment_content_type :profile_picture, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"], :presence => true
  
  validates :firstname,:lastname, :presence => true,:length => { :minimum => 2, :message => "Must be at least 2 characters" }
  
  validates :contact_no, :presence => {:message => "contact number should be of 10 digits"},:numericality => true , :length => { :minimum => 10, :maximum => 15 }
  
  validates :gender, inclusion: %w(male female)
end
