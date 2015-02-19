class Comments < ActiveRecord::Base
  belongs_to :writer
  belongs_to :posts

  validates_presence_of :posts_id
end
