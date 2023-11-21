class AddDetailsToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :affiliation, :string
    add_column :profiles, :mobile, :string
    add_column :profiles, :company_phone, :string
    add_column :profiles, :private_phone, :string
  end
end
