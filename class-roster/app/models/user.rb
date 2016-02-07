class User < ActiveRecord::Base
  belongs_to :course
  validates :email, presence: true
  validates :email, uniqueness: true
end
