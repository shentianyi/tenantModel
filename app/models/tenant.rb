class Tenant < ActiveRecord::Base
  attr_accessible :company_name, :edition, :subscription_reference, :expire_at,:subscription_status
  attr_accessible :customer_first_name, :customer_last_name,:customer_email,:customer_phone
  has_many :users
end
