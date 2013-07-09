class UserConfirmationMailer < ActionMailer::Base
  default from: "from@example.com"

  def deliver_confirmation(user)
    @user=user
    @url = Rails.configuration.domain + (@user.perishable_token)
    mail(to:@user.email, subject: 'Confirm your registration by' + $product_name)

  end
end
