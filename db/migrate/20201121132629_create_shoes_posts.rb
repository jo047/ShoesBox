class CreateShoesPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :shoes_posts do |t|
      t.integer :user_id
      t.string :shoes_image_id
      t.string :purchase_store
      t.string :shoes_name
      t.string :brand_name
      t.text :shoes_introduction

      t.timestamps
    end
  end
end
