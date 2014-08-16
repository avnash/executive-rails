class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.belongs_to :post
      t.belongs_to :user

      t.timestamps
    end
      add_index :follows, :post_id
      add_index :follows, :user_id
      add_index :follows, [:post_id, :user_id], unique: true
  end
end
