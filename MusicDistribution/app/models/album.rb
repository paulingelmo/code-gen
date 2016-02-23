class Album < ActiveRecord::Base
  include SearchableByName
end
