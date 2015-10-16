require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        :title => "Title",
        :post_tag_id => 1,
        :content => "Content",
        :summary => "Summary",
        :img => "Img"
      ),
      Post.create!(
        :title => "Title",
        :post_tag_id => 1,
        :content => "Content",
        :summary => "Summary",
        :img => "Img"
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => "Summary".to_s, :count => 2
    assert_select "tr>td", :text => "Img".to_s, :count => 2
  end
end
