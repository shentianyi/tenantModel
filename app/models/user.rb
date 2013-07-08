class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  acts_as_authentic do |c|
    c.login_field = :email
  end


  def create_tenant_super_user!(email,password,password_confirmation,company_name)
      user = User.new(:email=>email,:password=>password,:password_confirmation=>password_confirmation)
      tenant = Tenant.new(:company_name=>company_name)



  end
end
