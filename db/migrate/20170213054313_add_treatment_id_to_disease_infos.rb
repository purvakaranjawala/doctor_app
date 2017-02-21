class AddTreatmentIdToDiseaseInfos < ActiveRecord::Migration[5.0]
  def change
    add_column :disease_infos, :treatment_id, :integer
  end
end
