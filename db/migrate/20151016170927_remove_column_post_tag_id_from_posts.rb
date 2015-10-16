class RemoveColumnPostTagIdFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :post_tag_id
    remove_column :tags, :post_tag_id
  end
end
