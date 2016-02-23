class Label < ActiveRecord::Base
  include SearchableByName
end
