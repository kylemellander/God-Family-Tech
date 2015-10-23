class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  accepts_nested_attributes_for :post, :user

  validates_presence_of :content
end
