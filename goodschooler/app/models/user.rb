class User < ActiveRecord::Base
  belongs_to :code_school
  has_one :profile
  has_many :projects
  validates :email, presence: true

scope :active, -> {where(active: true)}
  # def self.active
  #   where(active: true)
  # end

scope :cohort, -> (number) {where(cohort: number)}
  # def self.cohort(number)
  #   where(cohort: number)
  # end

  def self.active_cohort(number)
    active.cohort(number)
  end

  # def to_s
  #   "This is #{self.class} whose name is #{}"
  # end
end
