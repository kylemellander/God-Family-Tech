require 'rails_helper'

describe PostTag do
  it { should belong_to :post }
  it { should belong_to :tag }
end
