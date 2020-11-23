class CreateShoesFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :shoes_favorites do |t|
      t.integer :user_id
      t.integer :shoes_post_id

      t.timestamps
    end
  end
end
