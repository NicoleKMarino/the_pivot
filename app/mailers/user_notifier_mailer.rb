class UserNotifierMailer < ApplicationMailer
  default from: 'makemypaypday@gmail.com'

  def send_signup_email(user)
    @user = user
    mail(
      to: @user.email,
      subject: "Welcome to MakeMyPayday!"
      )
  end

  def send_confirmation_email(user, job_application)
    @user = user
    @job_application = job_application
    mail(
      to: @user.email,
      subject: "We've received your application for the  #{@job_application.job.title} position!"
    )
  end
end
