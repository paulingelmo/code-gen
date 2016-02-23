class CodeSchool < ActiveRecord::Base
  has_many :users
  has_many :projects, through: :users
end
