class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.belongs_to :post
      t.belongs_to :user

      t.timestamps
    end
      add_index :likes, :post_id
      add_index :likes, :user_id
      add_index :likes, [:post_id, :user_id], unique: true
  end
end
