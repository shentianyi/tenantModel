class User < ActiveRecord::Base
  belongs_to :tenant

  attr_accessible :email, :password, :password_confirmation,:tenantId,:status,:perishable_token


  acts_as_authentic do |c|
    c.login_field = :email
  end


  def lock email
    user = User.find_by_email(email)
    if user
      user.status = User_status::LOCKED
      return user.save
    else
      return false
    end
  end


  def deliver_user_confirmation!
    reset_perishable_token!
    UserConfirmationMailer.deliver_confirmation(self).deliver

  end


  def create_tenant_user!(email,password,password_confirmation,company_name)
    self.email=email
    self.password=password
    self.password_confirmation=password_confirmation

    @tenant= Tenant.new(:company_name=>company_name,
                       :edition=>$trial_edition,
                       :subscription_status=>Subscription_status::TRIAL,
                       :expire_at=>15.days.from_now)

    begin
      ActiveRecord::Base.transaction do
        self.tenant = @tenant
        self.save!
       return self
        end
    rescue ActiveRecord::RecordInvalid => invalid
      raise invalid
    end
  end



end
