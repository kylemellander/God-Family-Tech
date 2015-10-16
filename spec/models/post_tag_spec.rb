require 'rails_helper'

describe PostTag do
  it { should belong_to :post }
  it { should belong_to :tag }
  it { should validate_presence_of :post_id }
  it { should validate_presence_of :tag_id }
end
