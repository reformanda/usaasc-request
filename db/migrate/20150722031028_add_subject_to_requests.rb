class AddSubjectToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :subject, :string
    add_column :requests, :priority, :integer
  end
end
