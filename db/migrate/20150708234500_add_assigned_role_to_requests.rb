class AddAssignedRoleToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :assigned_to_role, :integer
    add_column :requests, :status, :integer
  end
end
