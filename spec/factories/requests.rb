FactoryGirl.define do
  factory :request do
    name "MyString"
email "MyString"
phone "MyString"
other_phone "MyString"
laptop_issue false
laptop_desc "MyText"
software_issue false
software_desc "MyText"
blackberry_issue false
blackberry_desc "MyText"
email_issue false
email_desc "MyText"
pst_issue false
pst_desc "MyText"
shared_folder_issue false
shared_folder_desc "MyText"
other_hardware_issue false
other_hardware_desc "MyText"
air_card_issue false
air_card_desc "MyText"
other_issue false
other_issue "MyText"
  end

end
