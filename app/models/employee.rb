class Employee < ActiveRecord::Base
  belongs_to :user
  
  validates :firstname,  presence: true, length: { maximum: 80 }
  validates :lastname,  presence: true, length: { maximum: 80 }
  
  def fullname
     "#{firstname} #{lastname}"
  end
end
