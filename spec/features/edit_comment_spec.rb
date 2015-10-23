require 'rails_helper'

describe "the edit a comment process" do
  it "edits a comment" do
    user = FactoryGirl.create(:user)
    page.set_rack_session('warden.user.user.key' => User.serialize_into_session(user).unshift("User"))
    post = Post.create(title: "Ok", content:"ok")
    comment = Comment.create(content: "Yo", post_id: post.id, user_id: user.id)
    visit post_path(post)
    click_on 'edit'
    fill_in 'Content', :with => 'Wash the dog'
    click_on 'Update Comment'
    expect(page).to have_content 'Wash the dog'
  end

  it "gives error when no content is entered" do
    user = FactoryGirl.create(:user)
    page.set_rack_session('warden.user.user.key' => User.serialize_into_session(user).unshift("User"))
    post = Post.create(title: "Ok", content:"ok")
    comment = Comment.create(content: "Yo", post_id: post.id, user_id: user.id)
    visit post_path(post)
    click_on 'edit'
    fill_in 'Content', :with => ''
    click_on 'Update Comment'
    expect(page).to have_content 'error'
  end

  it "deletes a comment" do
    user = FactoryGirl.create(:user)
    page.set_rack_session('warden.user.user.key' => User.serialize_into_session(user).unshift("User"))
    post = Post.create(title: "Ok", content:"ok")
    comment = Comment.create(content: "Yo", post_id: post.id, user_id: user.id)
    visit post_path(post)
    click_on 'delete'
    expect(page).to have_content 'Comment was deleted.'
  end

  it "doesn't allow access to editing a comment if you aren't the poster" do
    user1 = FactoryGirl.create(:user)
    user2 = User.create(email: "email1@example.com", password: "12345678", password_confirmation: "12345678")
    page.set_rack_session('warden.user.user.key' => User.serialize_into_session(user2).unshift("User"))
    post = Post.create(title: "Ok", content:"ok")
    comment = Comment.create(content: "Yo", post_id: post.id, user_id: user1.id)
    visit edit_post_comment_path(post, comment)
    expect(page).to have_content 'You do not have permission to do that.'
  end


end
