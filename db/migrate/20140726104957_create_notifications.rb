class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.belongs_to :user, null: false
      t.belongs_to :post, null: false
      t.integer :notif_user, null: false
      t.string :action, null: false
      t.boolean :seen, default: false

      t.timestamps
    end
  add_index :notifications, :user_id
  add_index :notifications, :post_id
  end
end
