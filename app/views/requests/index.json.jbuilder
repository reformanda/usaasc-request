json.array!(@requests) do |request|
  json.extract! request, :id, :name, :email, :phone, :other_phone, :laptop_issue, :laptop_desc, :software_issue, :software_desc, :blackberry_issue, :blackberry_desc, :email_issue, :email_desc, :pst_issue, :pst_desc, :shared_folder_issue, :shared_folder_desc, :other_hardware_issue, :other_hardware_desc, :air_card_issue, :air_card_desc, :other_issue, :other_issue
  json.url request_url(request, format: :json)
end
