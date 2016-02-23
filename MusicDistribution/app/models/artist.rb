class Artist < ActiveRecord::Base
  include SearchableByName
end
