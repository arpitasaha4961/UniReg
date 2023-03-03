class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :address
      t.string :phone
      t.string :email
      t.string :emergency_contact_name
      t.string :emergency_contact_phone

      t.timestamps
    end
  end
end
