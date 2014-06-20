class UserMailer < ActionMailer::Base
  default from: "postmaster@app26554848.mailgun.org"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user
    @url = 'http://localhost:3000/users/sign_up'

    mail(to: @user.email, subject: "Welcome to my awesome site!")
  end

end
