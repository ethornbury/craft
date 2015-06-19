class Phase < ActiveRecord::Base

  validates :phasename, 
            :presence => {:message => "can't be empty" },
             length: { maximum: 100 }
  validates :note,  
            :presence => {:message => "can't be empty" },
            length: { maximum: 255 } #255 is limit of string field
  
  def self.search(query)
    # return an similar match of the query
       where("phasename like ?", "%#{query}%") 
  end
 
end