class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.belongs_to :user, null: false
      t.belongs_to :post, null: false
      t.integer :level, null: false, default: 0

      t.timestamps
    end
    add_index :rates, :post_id
    add_index :rates, :user_id
    add_index :rates, [:user_id, :post_id], unique: true
  end
end
