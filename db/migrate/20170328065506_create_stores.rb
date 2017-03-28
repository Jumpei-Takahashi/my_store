class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :title
      t.string :artist
      t.datetime :release_date
      t.text :comment
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
