class RequestMailer < ApplicationMailer

  def notification_email(request)
    @request = request
    @url = url_for(only_path: false, controller: "requests", action: "index") 
    @body = request.subject + ': ' + request.description
    mail(to: @request.email, subject: 'New Request')
  end

  def assignee_email(request)
    @request = request
    @url = url_for(only_path: false, controller: "requests", action: "edit", id: request.id) 
    @body = request.subject + ': ' + request.description
    mail(to: @request.email, subject: 'Request Assigned')
  end

end
