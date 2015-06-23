class Product < ActiveRecord::Base
  has_many :workphases
  
  validates :productname,  
            :presence => {:message => "can't be empty" },
            length: { maximum: 100 }
  validates :desc,  
            :presence => {:message => "can't be empty" },
            length: { maximum: 255 } #255 is limit of string field
  
  def self.search(query)
    # return an similar match of the query
     where("productname ILIKE ?", "%#{query}%") 
  end
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Product.create! row.to_hash
    end
  end
    
  def self.to_csv
    CSV.generate do |csv|
        csv << column_names
        all.each do |product|
            csv << product.attributes.values_at(*column_names)
        end
    end
  end
end