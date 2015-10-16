require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
    assign(:post, Post.new(
      :title => "MyString",
      :post_tag_id => 1,
      :content => "MyString",
      :summary => "MyString",
      :img => "MyString"
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input#post_title[name=?]", "post[title]"

      assert_select "input#post_post_tag_id[name=?]", "post[post_tag_id]"

      assert_select "input#post_content[name=?]", "post[content]"

      assert_select "input#post_summary[name=?]", "post[summary]"

      assert_select "input#post_img[name=?]", "post[img]"
    end
  end
end
