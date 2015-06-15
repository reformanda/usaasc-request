require 'rails_helper'

RSpec.describe Request, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"

  before(:each) { @request = Request.new(email: 'user@example.com') }

  subject { @request }

  it { should respond_to(:email) }

  it "#email returns a string" do
    expect(@request.email).to match 'user@example.com'
  end


end
