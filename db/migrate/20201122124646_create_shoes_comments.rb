class CreateShoesComments < ActiveRecord::Migration[5.2]
  def change
    create_table :shoes_comments do |t|
      t.integer :user_id
      t.integer :shoes_post_id
      t.text :comment

      t.timestamps
    end
  end
end
