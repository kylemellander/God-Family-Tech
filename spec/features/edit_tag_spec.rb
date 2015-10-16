require 'rails_helper'

describe "the edit a tag process" do
  it "edits a new tag" do
    tag = Tag.create(name: "Ok")
    visit tag_path(tag)
    click_on 'Edit'
    fill_in 'Name', :with => 'Wash the dog'
    click_on 'Update Tag'
    expect(page).to have_content 'Wash the dog'
  end

  it "gives error when no name is entered" do
    tag = Tag.create(name: "Ok")
    visit tag_path(tag)
    click_on 'Edit'
    fill_in 'Name', :with => ''
    click_on 'Update Tag'
    expect(page).to have_content 'error'
  end
end
