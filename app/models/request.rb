class Request < ActiveRecord::Base
  enum assigned_to_role: [:approver, :worker, :requester]
  enum status: [:newrequest, :approved, :disapproved, :completed, :closed, :canceled]
  has_and_belongs_to_many  :issues, join_table: :requests_issues
  after_initialize :set_default_status, if: :new_record?
  attr_accessor :comment

  scope :by_status, -> status { where("status = ?", status)}

  # comments
  acts_as_commentable
  
  def set_default_status
    self.status ||= :newrequest
  end

end
