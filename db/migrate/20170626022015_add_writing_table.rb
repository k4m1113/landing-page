class AddWritingTable < ActiveRecord::Migration[5.1]
  def change
    create_table :writings do |t|
      t.string :title
      t.date :date
      t.text :text

      t.timestamps null: false
    end
  end
end
