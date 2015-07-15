class Request < ActiveRecord::Base
  enum assigned_to_role: [:approver, :worker, :requester]
  enum status: [:newrequest, :approved, :disapproved, :completed, :closed, :canceled]
  has_and_belongs_to_many  :issues, join_table: :requests_issues


  scope :by_status, -> status { where("status = ?", status)}
end
