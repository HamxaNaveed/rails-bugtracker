class AddRoleToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :role, index: true
  end
end
