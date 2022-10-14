class CreateFixes < ActiveRecord::Migration[7.0]
  def change
    create_table :fixes do |t|
      t.string :name
      t.text :description
      t.references :project, null: false, foreign_key: true
      t.references :assign_to, foreign_key:{to_table: :users}
      
      t.timestamps
    end
  end
end
