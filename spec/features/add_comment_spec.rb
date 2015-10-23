require 'rails_helper'

describe "the add a comment process" do
  it "adds a new comment" do
    user = FactoryGirl.create(:user)
    page.set_rack_session('warden.user.user.key' => User.serialize_into_session(user).unshift("User"))
    post = Post.create(title:"ok", content: "Ok")
    visit post_path(post)
    fill_in "Add a Comment", with: "yup"
    click_on "Create Comment"
    expect(page).to have_content("yup")
  end

  it "gives error if no comment is made" do
    user = FactoryGirl.create(:user)
    page.set_rack_session('warden.user.user.key' => User.serialize_into_session(user).unshift("User"))
    post = Post.create(title:"ok", content: "Ok")
    visit post_path(post)
    click_on "Create Comment"
    expect(page).to have_content("Content can't be blank")
  end
end
