class Request < ActiveRecord::Base
  has_and_belongs_to_many  :issues, join_table: :requests_issues
end
