class Request < ActiveRecord::Base
  enum assigned_to_role: [:approver, :worker]
  enum status: [:newrequest, :approved, :disapproved, :resolved, :closed, :canceled]
  has_and_belongs_to_many  :issues, join_table: :requests_issues
end
