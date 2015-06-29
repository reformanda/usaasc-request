class CreateWorkerService
  def call
    user = User.find_or_create_by!(email: Rails.application.secrets.worker_email) do |user|
      user.password = Rails.application.secrets.worker_password
      user.password_confirmation = Rails.application.secrets.worker_password
      user.confirm!
      user.worker!
    end
  end
end