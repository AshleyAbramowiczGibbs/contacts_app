class Contact < ApplicationRecord
  def friendly_updated_at
    created_at.strftime("%m %d %y")
  end

  def full_name 
    "#{first_name} #{last_name}"
  end

  def japan_phone
    "+81 + #{phone_number}"
  end
    
end
