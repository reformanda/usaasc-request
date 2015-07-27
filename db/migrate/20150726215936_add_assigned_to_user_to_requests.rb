class AddAssignedToUserToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :assigned_to_user, :integer
  end
end
