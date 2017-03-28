class CreateStoreImages < ActiveRecord::Migration
  def change
    create_table :store_images do |t|
      t.integer :store_id
      t.string :image

      t.timestamps null: false
    end
  end
end
