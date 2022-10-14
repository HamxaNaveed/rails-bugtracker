class CreateTableUserProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :user_projects do |t|
      t.references :developer, foreign_key: {to_table: :users}
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
