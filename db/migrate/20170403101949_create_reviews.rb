class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :store_id
      t.integer :user_id
      t.text :body

      t.timestamps null: false
    end
  end
end
