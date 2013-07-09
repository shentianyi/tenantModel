class SubscriptionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]


  def new
     render
  end


  def create
    begin
      @user=User.new

      @user = @user.create_tenant_user!(params[:email],
                                        params[:password],
                                        params[:password_confirmation],
                                        params[:company_name])

      @user.deliver_user_confirmation!
      flash[:notice] = 'Your account has been created.Please finish the process with the mail confirmation'

      redirect_to confirmation_url
    rescue ActiveRecord::RecordInvalid => invalid


    end
  end



end
