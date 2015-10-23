require 'rails_helper'

describe "the edit a tag process" do
  it "edits a new tag" do
    user = FactoryGirl.create(:user)
    page.set_rack_session('warden.user.user.key' => User.serialize_into_session(user).unshift("User"))
    tag = Tag.create(name: "Ok")
    visit tag_path(tag)
    click_on 'Edit'
    fill_in 'Name', :with => 'Wash the dog'
    click_on 'Update Tag'
    expect(page).to have_content 'Wash the dog'
  end

  it "gives error when no name is entered" do
    user = FactoryGirl.create(:user)
    page.set_rack_session('warden.user.user.key' => User.serialize_into_session(user).unshift("User"))
    tag = Tag.create(name: "Ok")
    visit tag_path(tag)
    click_on 'Edit'
    fill_in 'Name', :with => ''
    click_on 'Update Tag'
    expect(page).to have_content 'error'
  end
end
