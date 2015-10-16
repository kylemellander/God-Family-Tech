require 'rails_helper'

describe Tag do
  it { should have_many :post_tags }
end
