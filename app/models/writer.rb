class Writer < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, :dependent => :destroy
  validates :email, format: /@/
end
