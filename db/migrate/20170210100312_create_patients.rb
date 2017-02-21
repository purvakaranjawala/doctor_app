class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string  :firstname
      t.string  :lastname
      t.string  :gender
      t.string  :city
      t.string  :state
      t.integer :contact_no
      t.integer :age
      t.date    :dob
      t.string  :profile_picture
      t.timestamps
    end
  end
end
