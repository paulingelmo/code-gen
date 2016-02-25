class Url < ActiveRecord::Base
  validates :url_short, uniqueness: true
end
