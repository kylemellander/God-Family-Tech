class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  accepts_nested_attributes_for :post, :user
end
