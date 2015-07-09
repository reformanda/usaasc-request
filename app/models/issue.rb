class Issue < ActiveRecord::Base
  has_and_belongs_to_many  :requests, join_table: :requests_issues
end
