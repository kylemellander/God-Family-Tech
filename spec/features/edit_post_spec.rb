require 'rails_helper'

describe "the edit a post process" do
  it "edits a post" do
    user = FactoryGirl.create(:user)
    page.set_rack_session('warden.user.user.key' => User.serialize_into_session(user).unshift("User"))
    post = Post.create(title: "Ok", content:"ok")
    visit post_path(post)
    click_on 'Edit'
    fill_in 'Title', :with => 'Wash the dog'
    click_on 'Update Post'
    expect(page).to have_content 'Wash the dog'
  end

  it "gives error when no title is entered" do
    user = FactoryGirl.create(:user)
    page.set_rack_session('warden.user.user.key' => User.serialize_into_session(user).unshift("User"))
    post = Post.create(title: "Ok", content:"ok")
    visit post_path(post)
    click_on 'Edit'
    fill_in 'Title', :with => ''
    click_on 'Update Post'
    expect(page).to have_content 'error'
  end

  it "gives error when no content is entered" do
    user = FactoryGirl.create(:user)
    page.set_rack_session('warden.user.user.key' => User.serialize_into_session(user).unshift("User"))
    post = Post.create(title: "Ok", content:"ok")
    visit post_path(post)
    click_on 'Edit'
    fill_in 'Content', :with => ''
    click_on 'Update Post'
    expect(page).to have_content 'error'
  end

  it "gives error when incorrect img is entered" do
    user = FactoryGirl.create(:user)
    page.set_rack_session('warden.user.user.key' => User.serialize_into_session(user).unshift("User"))
    post = Post.create(title: "Ok", content:"ok")
    visit post_path(post)
    click_on 'Edit'
    attach_file "Img", 'public/img/fake'
    click_on 'Update Post'
    expect(page).to have_content 'error'
  end

  it "destroys the post" do
    user = FactoryGirl.create(:user)
    page.set_rack_session('warden.user.user.key' => User.serialize_into_session(user).unshift("User"))
    post = Post.create(title: "Ok", content:"ok")
    visit post_path(post)
    click_on "Edit"
    click_on "Delete"
    expect(page).to have_content "Post was successfully destroyed."
  end

  it "doesn't allow access to editing a post if you aren't admin" do
    user1 = FactoryGirl.create(:user)
    user2 = User.create(email: "email1@example.com", password: "12345678", password_confirmation: "12345678")
    page.set_rack_session('warden.user.user.key' => User.serialize_into_session(user2).unshift("User"))
    post = Post.create(title: "Ok", content:"ok")
    visit edit_post_path(post)
    expect(page).to have_content 'You do not have permission to do that.'
  end
end
