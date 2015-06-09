class Employee < ActiveRecord::Base
  belongs_to :user

  
  validates :firstname,  presence: true, length: { maximum: 80 }
  validates :lastname,  presence: true, length: { maximum: 80 }
  
    def fullname
        "#{firstname} #{lastname}"
    end
    
    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            Employee.create! row.to_hash
        end
    end
    
    def self.to_csv
        CSV.generate do |csv|
            csv << column_names
            all.each do |employee|
                csv << employee.attributes.values_at(*column_names)
            end
        end
    end
end
