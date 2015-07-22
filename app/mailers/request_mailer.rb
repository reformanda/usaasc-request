class RequestMailer < ApplicationMailer

  def notification_email(request)
    @request = request
p @request.email
    mail(to: @request.email, subject: 'New Request')
  end

end
