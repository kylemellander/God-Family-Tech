require 'rails_helper'

describe "the add a tag process" do
  it "adds a new tag" do
    visit root_path
    click_link "Add A Tag"
    fill_in "Name", with: "What?"
    click_on "Create Tag"
    expect(page).to have_content "What?"
  end

  it "gives error when no name is entered" do
    visit new_tag_path
    click_on 'Create Tag'
    expect(page).to have_content "error"
  end
end
