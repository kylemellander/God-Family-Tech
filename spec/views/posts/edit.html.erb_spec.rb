require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :title => "MyString",
      :post_tag_id => 1,
      :content => "MyString",
      :summary => "MyString",
      :img => "MyString"
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input#post_title[name=?]", "post[title]"

      assert_select "input#post_post_tag_id[name=?]", "post[post_tag_id]"

      assert_select "input#post_content[name=?]", "post[content]"

      assert_select "input#post_summary[name=?]", "post[summary]"

      assert_select "input#post_img[name=?]", "post[img]"
    end
  end
end
