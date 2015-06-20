class AddOtherDescToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :other_desc, :text
  end
end
