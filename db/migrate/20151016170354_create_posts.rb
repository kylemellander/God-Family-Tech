class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :post_tag_id
      t.string :content
      t.string :summary
      t.string :img

      t.timestamps null: false
    end
  end
end
