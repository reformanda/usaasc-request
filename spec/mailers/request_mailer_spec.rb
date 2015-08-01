require "rails_helper"

RSpec.describe RequestMailer, type: :mailer do
let(:request) {  FactoryGirl.create(:request)}
let(:mail1) { RequestMailer.notification_email(request) }
let(:mail2) { RequestMailer.assignee_email(request) }#it "renders the headers" do
#      mail.content_type.should start_with('multipart/alternative') #html / text support
#end

  scenario 'New Reuqest uses the correct subject' do
     expect(mail1.subject).to eq("New Request")
   end

  scenario 'Assignment uses the correct subject' do
     expect(mail2.subject).to eq("Request Assigned")
   end

  #pending "add some examples to (or delete) #{__FILE__}"
end
