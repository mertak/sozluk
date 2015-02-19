class Post < ActiveRecord::Base
  belongs_to :writer
  has_many :comment
  validates_presence_of :writer_id
end
