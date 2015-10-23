require 'rails_helper'

describe "the add a post process" do
  it "adds a new post" do
    user = FactoryGirl.create(:user)
    page.set_rack_session('warden.user.user.key' => User.serialize_into_session(user).unshift("User"))
    visit posts_path
    click_link "Add A Post"
    fill_in "Title", with: "What?"
    fill_in "Content", with: "Ok"
    click_on "Create Post"
    expect(page).to have_content "What?"
  end

  it "gives error when no title is entered" do
    user = FactoryGirl.create(:user)
    page.set_rack_session('warden.user.user.key' => User.serialize_into_session(user).unshift("User"))
    visit new_post_path
    fill_in "Content", with: "Ok"
    click_on 'Create Post'
    expect(page).to have_content "Title can't be blank"
  end

  it "gives error when no content is entered" do
    user = FactoryGirl.create(:user)
    page.set_rack_session('warden.user.user.key' => User.serialize_into_session(user).unshift("User"))
    visit new_post_path
    fill_in "Title", with: "Ok"
    click_on 'Create Post'
    expect(page).to have_content "Content can't be blank"
  end

  it "gives error when img is invalid is entered" do
    user = FactoryGirl.create(:user)
    page.set_rack_session('warden.user.user.key' => User.serialize_into_session(user).unshift("User"))
    visit new_post_path
    fill_in "Title", with: "Ok"
    fill_in "Content", with: "Ok"
    attach_file "Img", 'public/img/fake'
    click_on 'Create Post'
    expect(page).to have_content "Img must be a url for gif"
  end

end
