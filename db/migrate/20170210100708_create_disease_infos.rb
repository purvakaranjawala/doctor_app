class CreateDiseaseInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :disease_infos do |t|
      t.string :symptoms
      t.references :doctor, foreign_key: true
      t.references :patient, foreign_key: true
      t.string :symptom_time
      t.string :patient_type
      t.timestamps
    end
  end
end
