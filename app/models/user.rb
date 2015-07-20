class User < ActiveRecord::Base
  enum role: [:user, :approver, :worker, :admin]
  after_initialize :set_default_role, if: :new_record?
  before_save :update_name

  def set_default_role
    self.role ||= :user
  end


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :invitable,
         :recoverable, :rememberable, :trackable, :validatable


private
  def update_name
    unless self.first_name.blank? || self.last_name.blank?
      self.name = self.first_name + " " + self.last_name
    end
  end
         
end
