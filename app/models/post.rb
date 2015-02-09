class Post < ActiveRecord::Base
  belongs_to :writer
  validates_presence_of :writer_id
end
