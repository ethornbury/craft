class Employee < ActiveRecord::Base
  belongs_to :user
  has_many   :workphases

  #validates :firstname,  presence: true,length: { maximum: 80 }
  validates :firstname,  
            :length  => {:minimum => 2, :maximum => 80, :message => "invalid length"},
            :presence => {:message => "can't be empty" }
  validates :lastname, 
            :length  => {:minimum => 2, :maximum => 80, :message => "invalid length"},
            :presence => {:message => "can't be empty" }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  #this checks for the presence of . and @ in email
  validates :email, length: { maximum: 255 },
                    :presence => {:message => "cant be empty" },
                    :format => { with: VALID_EMAIL_REGEX, :message => "invalid format" },
                    uniqueness: { case_sensitive: false }
                    
    def fullname
        "#{firstname} #{lastname}"
    end
    
    def self.search(query)
    # return an similar match of the query
       where("lastname like ?", "%#{query}%") 
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