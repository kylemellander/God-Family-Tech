require 'rails_helper'

describe "the edit a post process" do
  it "edits a post" do
    post = Post.create(title: "Ok", content:"ok")
    visit post_path(post)
    click_on 'Edit'
    fill_in 'Title', :with => 'Wash the dog'
    click_on 'Update Post'
    expect(page).to have_content 'Wash the dog'
  end

  it "gives error when no title is entered" do
    post = Post.create(title: "Ok", content:"ok")
    visit post_path(post)
    click_on 'Edit'
    fill_in 'Title', :with => ''
    click_on 'Update Post'
    expect(page).to have_content 'error'
  end

  it "gives error when no content is entered" do
    post = Post.create(title: "Ok", content:"ok")
    visit post_path(post)
    click_on 'Edit'
    fill_in 'Content', :with => ''
    click_on 'Update Post'
    expect(page).to have_content 'error'
  end

  it "gives error when incorrect img is entered" do
    post = Post.create(title: "Ok", content:"ok")
    visit post_path(post)
    click_on 'Edit'
    fill_in 'Img', :with => 'blah'
    click_on 'Update Post'
    expect(page).to have_content 'error'
  end
end
