class RemoveDepartmentFromProfiles < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :department, :string
  end
end
