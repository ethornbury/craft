class Phase < ActiveRecord::Base
  has_many :workphases
  #links phase with workphases
  
  validates :phasename, 
            :presence => {:message => "can't be empty" },
            :length => { maximum: 100 }
  validates :note,  
            :presence => {:message => "can't be empty" },
            :length => { maximum: 255 } #255 is limit of string field
  
  def self.search(query)
    #returns a similar match of the query
    #ILIKE facilitates heroku postgreSQL db
       where("phasename ILIKE ?", "%#{query}%") 
  end
end