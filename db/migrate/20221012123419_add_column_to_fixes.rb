class AddColumnToFixes < ActiveRecord::Migration[7.0]
  def change
    add_column :fixes, :complete , :boolean
  end
end
