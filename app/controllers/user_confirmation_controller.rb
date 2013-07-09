class UserConfirmationController < ApplicationController
     before_filter :load_user_using_perishable_token, :only=>[:update]
     before_filter :require_no_user, :only=>[:new,:create,:update]


  def new
     render

  end


  def create
    @user= User.find_by_email(params[:email])
    if @user
      @user.deliver_user_confirmation!
      flash[:notice]='confirmation mail has been sent to your mailbox'
      redirect_to confirmation_url
    else
      flash[:alert]='email not found'
      render :action=>'new'
    end
  end



  def update
     @user.status = User_status::ACTIVE
    if @user.save
      flash[:notice]='You are successfully signed up,please login again'
      redirect_to new_user_session_url
    else
      flash[:notice] = 'Something wrong when you finalized your registration'
       redirect_to confirmation_url
    end
  end








  end
