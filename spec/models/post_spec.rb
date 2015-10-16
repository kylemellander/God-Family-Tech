require 'rails_helper'

describe Post do
  it { should have_many :post_tags }
end
