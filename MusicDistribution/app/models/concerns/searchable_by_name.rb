module SearchableByName
  extend ActiveSupport::Concern

  included do
    #scope :search, ->(term) {where("name LIKE ?", "%#{term}%")}
  end

  module ClassMethods
    def search(term)
      where("name LIKE ?", "%#{term}%")
    end
  end
end
