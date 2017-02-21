class CreateDoctors < ActiveRecord::Migration[5.0]
  def change
    create_table :doctors do |t|
      t.string :firstname
      t.string :lastname
      t.string :gender
      t.string :city
      t.string :state
      t.integer :contact_no
      t.string :specialist
      t.string :practice_from
      t.string :profile_picture
      t.timestamps
    end
  end
end
