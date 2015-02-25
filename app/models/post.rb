class Post < ActiveRecord::Base
  belongs_to :writer
  has_many :comment
  validates_presence_of :writer_id
  validates :title, uniqueness: true, length: {in: 3..50}
  validates :content, length: {in: 3..500}
end
