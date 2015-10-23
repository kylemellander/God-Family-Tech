class AddImgColumnsToPosts < ActiveRecord::Migration
  def up
    add_attachment :posts, :img
  end

  def down
    remove_attachment :posts, :img
  end
end
