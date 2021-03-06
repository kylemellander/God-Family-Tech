class Post < ActiveRecord::Base
  has_many :post_tags
  has_and_belongs_to_many :tags
  has_many :comments
  has_attached_file :img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\Z/

  validates_presence_of :title, :content
  validates :img, allow_blank: true, format: {
    with: %r{\.gif|jpg|png|jpeg}i,
    message: 'must be a url for gif, jpg, jpeg, or png image.'
  }
  accepts_nested_attributes_for :tags
end
