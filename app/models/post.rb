class Post < ActiveRecord::Base
  has_many :post_tags
  validates_presence_of :title, :content
  validates :img, allow_blank: true, format: {
    with: %r{\.gif|jpg|png|jpeg}i,
    message: 'must be a url for gif, jpg, jpeg, or png image.'
  }
end
