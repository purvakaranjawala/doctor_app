class CreateTreatments < ActiveRecord::Migration[5.0]
  def change
    create_table :treatments do |t|
      t.string  :disease_name
      t.date    :next_checkup
      t.string  :medication
      t.string  :testing
      t.text    :precaution
      t.string  :dose_period
      t.float   :fees
      t.integer :disease_info_id
      t.timestamps
    end
  end
end
