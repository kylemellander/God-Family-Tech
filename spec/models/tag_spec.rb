require 'rails_helper'

describe Tag do
  it { should have_many :post_tags }
  it { should validate_presence_of :name }
end
