class CreateNonadminService
  def call
    user = User.find_or_create_by!(email: Rails.application.secrets.nonadmin_email) do |user|
      user.password = Rails.application.secrets.nonadmin_password
      user.password_confirmation = Rails.application.secrets.nonadmin_password
      user.name = Rails.application.secrets.nonadmin_name
      user.confirm!

    end
  end
end