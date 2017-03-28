class CreateStoreIds < ActiveRecord::Migration
  def change
    create_table :store_genres do |t|
      t.integer :store_id
      t.integer :genre_id

      t.timestamps null: false
    end
  end
end
