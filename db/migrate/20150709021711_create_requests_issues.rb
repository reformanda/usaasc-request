class CreateRequestsIssues < ActiveRecord::Migration
  def change
    create_table :requests_issues do |t|
      t.integer :request_id
      t.integer :issue_id

      t.timestamps null: false
    end
  end
end
