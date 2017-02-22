class ChangeIntegerFormatInDoctors < ActiveRecord::Migration[5.0]
  def change
	  change_column :doctors, :contact_no, :string
	end
end
