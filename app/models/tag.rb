class Tag < ActiveRecord::Base
  has_many :post_tags
  validates_presence_of :name
end
