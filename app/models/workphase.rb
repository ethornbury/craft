class Workphase < ActiveRecord::Base
  belongs_to :product
  belongs_to :phase
  belongs_to :employee
  
  validates :totalToMake,  
            :presence => {:message => "must be provided"},
            :numericality => {greater_than: 0, :message => "must be greater than 0"}
  
  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |workphase|
        csv << workphase.attributes.values_at(*column_names)
      end
    end
  end

  def self.search(query)
    #where(:title, query) -> ##This would return an exact match of the query
    # return an similar match of the query
       where("product_id like ?", "%#{query}%")
  end
  def self.search(search)
       where("phase_id like ?", "%#{search}%")
  end
end