class UserProject < ApplicationRecord
  belongs_to :project
  belongs_to :developer, class_name: "User", foreign_key: 'developer_id'

end
