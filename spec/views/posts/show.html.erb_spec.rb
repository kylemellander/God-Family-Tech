require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :title => "Title",
      :post_tag_id => 1,
      :content => "Content",
      :summary => "Summary",
      :img => "Img"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Content/)
    expect(rendered).to match(/Summary/)
    expect(rendered).to match(/Img/)
  end
end
