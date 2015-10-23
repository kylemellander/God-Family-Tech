require 'rails_helper'

describe Post do
  it { should have_and_belong_to_many :tags }
  it { should validate_presence_of :title }
  it { should validate_presence_of :content }
  it { should validate_attachment_content_type(:img).
                  allowing('image/png', 'image/gif').
                  rejecting('text/plain', 'text/xml') }
end
