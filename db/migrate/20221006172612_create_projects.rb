class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.references :created_by, foreign_key: {to_table: :users}
      t.references :qa, foreign_key: {to_table: :users}
      
      t.timestamps
    end
  end
end
