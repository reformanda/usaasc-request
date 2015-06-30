class CreateApproverService
  def call
    user = User.find_or_create_by!(email: Rails.application.secrets.approver_email) do |user|
      user.password = Rails.application.secrets.approver_password
      user.password_confirmation = Rails.application.secrets.approver_password
      user.name = Rails.application.secrets.approver_name
      user.confirm!
      user.approver!
    end
  end
end