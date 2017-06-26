class AddEducationTable < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :url
      t.date :start_date
      t.date :end_date
      t.string :degree
      t.string :location
      t.string :summary
      t.string :screenshot

      t.timestamps null: false
    end
  end
end
