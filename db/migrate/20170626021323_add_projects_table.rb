class AddProjectsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.date :when
      t.string :project_type
      t.string :deployment
      t.string :url
      t.string :screenshot

      t.timestamps null: false
    end
  end
end
