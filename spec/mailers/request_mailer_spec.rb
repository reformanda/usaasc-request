require "rails_helper"

RSpec.describe RequestMailer, type: :mailer do
#let(:request) {  FactoryGirl.create(:request)}
request1 = FactoryGirl.create(:request, id: 1, email: 'user1@email.com')
request2 = FactoryGirl.create(:request, id: 2, assigned_to_user: 1, email: 'user2@email.com')
#let(:request2) {  FactoryGirl.create(:request)}
let(:mail1) { RequestMailer.notification_email(request1) }
let(:mail2) { RequestMailer.assignee_email(request2) }
#it "renders the headers" do
#      mail.content_type.should start_with('multipart/alternative') #html / text support
#end

  scenario 'New Request uses the correct subject' do
     expect(mail1.subject).to eq("New Request")
   end

  scenario 'Assignment uses the correct subject' do
     expect(mail2.subject).to eq('Request Assigned')
   end

  scenario 'Assignment email' do
     expect(mail2.to).to eq(['user2@email.com'])
   end

  #pending "add some examples to (or delete) #{__FILE__}"
end
