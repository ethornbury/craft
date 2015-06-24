class Workphase < ActiveRecord::Base
  belongs_to :product
  belongs_to :phase
  belongs_to :employee
  #links workphase to each of the above tables
  
  validates :totalToMake,  
            :presence => {:message => "must be provided"},
            :numericality => {greater_than: 0, :message => "must be greater than 0"}
  validates :product_id,
            :presence => {:message => "can't be empty" }
  validates :phase_id,
            :presence => {:message => "can't be empty" }

  def self.to_csv
    #create the csv from the table 
    CSV.generate do |csv|
      csv << column_names
      all.each do |workphase|
        csv << workphase.attributes.values_at(*column_names)
      end
    end
  end
  
  def self.search_by_phase(query)
    #return an exact integer match of the query
    where("phase_id = ?", "#{query}")
  end
  
  def self.search_by_product(query)
    #return an exact integer match of the query
    where("product_id = ?", "#{query}") 
  end
end