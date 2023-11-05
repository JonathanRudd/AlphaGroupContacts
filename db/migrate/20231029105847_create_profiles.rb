class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :department
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :phone_number
      t.string :sns_information

      t.timestamps
    end
  end
end
