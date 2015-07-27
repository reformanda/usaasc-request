class AddCreatedByUserToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :created_by_user, :integer
  end
end
