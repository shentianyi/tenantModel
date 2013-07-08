class SubscriptionController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]

  def new
     render
  end

  def create
    user = User.new(:email=>params[:email],:password=>params[:password],:password_confirmation=>params[:password_confirmation])
    tenant= Tenant.new(:company_name=>params[:company_name])



  end

  def update

  end

end
