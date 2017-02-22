class Patient < ApplicationRecord
	has_many :disease_infos,dependent: :destroy
	has_many :doctors, through: :disease_infos, foreign_key: "doctor_id"
	has_many :treatments, through: :disease_infos
	has_attached_file :profile_picture, :styles => { :medium => "300x300#", :thumb => "100x100#" }
  
  validates_attachment_content_type :profile_picture, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
  validates :firstname,:lastname, :presence => true,:length => { :minimum => 2 }
  
  validates :contact_no,   :presence => {:message => 'hello world, bad operation!'},:numericality => true,:length => { :minimum => 10, :maximum => 11 }
  
  scope :distinct_name, -> {select ('distinct on (id) *')}
  
  before_save :total_age
  
  def total_age
    self.age = Time.now.year - dob.year
  end 
end
