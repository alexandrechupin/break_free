class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Merci pour votre inscription sur Breakfree')
  end

  def report
    @recipient_email = params[:user]
    mail(to: @recipient_email, subject: 'Incident signalé le')
  end
end
