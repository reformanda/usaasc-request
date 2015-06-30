class Request < ActiveRecord::Base
  enum assigned_to_role: [:approver, :worker]
  enum status: [:newrequest, :cancelled, :disapproved, :inprogress, :completed]
  validates :name, presence: true
  validates :email, presence: true
end
