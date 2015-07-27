class Request < ActiveRecord::Base
  enum assigned_to_role: [:approver, :worker, :requester]
  enum status: [:newrequest, :approved, :disapproved, :completed, :closed, :canceled]
  has_and_belongs_to_many  :issues, join_table: :requests_issues

  belongs_to :assignee, :class_name => 'User', :foreign_key => 'assigned_to_user'
  belongs_to :creator, :class_name => 'User', :foreign_key => 'created_by_user'


  after_initialize :set_default_status, if: :new_record?
  attr_accessor :comment

  scope :by_status, -> status { where("status = ?", status)}

  include ActiveModel::Dirty 

  # comments
  acts_as_commentable
  
  def set_default_status
    self.status ||= :newrequest
  end

  validates :subject, :presence => true
  validates :description, :presence => true



end
