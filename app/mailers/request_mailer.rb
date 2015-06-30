class RequestMailer < ApplicationMailer

  def notification_email(request)
    @request = request

    mail(to: @request.email, subject: 'New Request')
  end

end
