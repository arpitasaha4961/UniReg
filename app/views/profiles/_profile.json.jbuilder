json.extract! profile, :id, :user_id, :first_name, :last_name, :date_of_birth, :address, :phone, :email, :emergency_contact_name, :emergency_contact_phone, :created_at, :updated_at
json.url profile_url(profile, format: :json)
