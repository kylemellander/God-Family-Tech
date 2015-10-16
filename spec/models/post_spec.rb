require 'rails_helper'

describe Post do
  it { should have_many :post_tags }
  it { should validate_presence_of :title }
  it { should validate_presence_of :content }
  it { should allow_value("frank.jpg").for(:img) }
  it { should allow_value("").for(:img) }
  it { should_not allow_value("frank.svg").for(:img) }
end
