class CreatePostsTags < ActiveRecord::Migration
  def change
    create_table :posts_tags, id: false do |t|
      t.belongs_to :tag, null: false
      t.belongs_to :post, null: false
    end
    add_index :posts_tags, :tag_id
    add_index :posts_tags, [:post_id, :tag_id] , unique: true
  end
end
