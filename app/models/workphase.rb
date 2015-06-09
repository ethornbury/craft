class Workphase < ActiveRecord::Base
  belongs_to :product
  belongs_to :phase
  belongs_to :employee
  
  validates :total,  presence: true
end
