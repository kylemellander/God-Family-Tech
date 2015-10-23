require 'rails_helper'

describe "the add a tag process" do
  it "adds a new tag" do
    user = FactoryGirl.create(:user)
    page.set_rack_session('warden.user.user.key' => User.serialize_into_session(user).unshift("User"))
    visit root_path
    click_link "Add A Tag"
    fill_in "Name", with: "What?"
    click_on "Create Tag"
    expect(page).to have_content "What?"
  end

  it "gives error when no name is entered" do
    user = FactoryGirl.create(:user)
    page.set_rack_session('warden.user.user.key' => User.serialize_into_session(user).unshift("User"))
    visit new_tag_path
    click_on 'Create Tag'
    expect(page).to have_content "error"
  end
end
