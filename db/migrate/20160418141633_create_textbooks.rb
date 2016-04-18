class CreateTextbooks < ActiveRecord::Migration
  def change
    create_table :textbooks do |t|
      t.string :title
      t.decimal :price
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
