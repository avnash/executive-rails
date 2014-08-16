class CreateAngers < ActiveRecord::Migration
  def change
    create_table :angers do |t|
      t.belongs_to :user, null: false
      t.belongs_to :post, null: false
      t.integer :level, null: false, default: 0

      t.timestamps
    end
    add_index :angers, :post_id
    add_index :angers, :user_id
    add_index :angers, [:user_id, :post_id], unique: true
  end
end
