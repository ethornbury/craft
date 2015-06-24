class Employee < ActiveRecord::Base
  belongs_to :user
  #this links the employee to the user
  has_many :workphases
  #this links the employee to workphases
    
  #validates :firstname,  presence: true,length: { maximum: 80 }
  #above line is another syntax for the lines below
  validates :firstname,  
            :length  => {:minimum => 2, :maximum => 80, :message => "invalid length"},
            :presence => {:message => "can't be empty" }
  validates :lastname, 
            :length  => {:minimum => 2, :maximum => 80, :message => "invalid length"},
            :presence => {:message => "can't be empty" }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  #this checks for the presence of . and @ in email
  validates :email, length: { maximum: 255 },
                    :presence => {:message => "can't be empty" },
                    :format => { with: VALID_EMAIL_REGEX, :message => "invalid format" },
                    uniqueness: { case_sensitive: false }
                    
    def fullname  #to display the employee name concatonated
        "#{firstname} #{lastname}"
    end
    
    def self.search(query)
    # returns a similar match of the query
       where("lastname ILIKE ?", "%#{query}%") 
       #ILIKE facilitates the heroku postgreSQL db
    end
    
    def self.import(file)  
        #importing csv file and creating employee record
        #excludes first line in csv file which contains headings
        CSV.foreach(file.path, headers: true) do |row|
            Employee.create! row.to_hash
        end
    end
    
    def self.to_csv   
        #create the csv from the table 
        CSV.generate do |csv|
            csv << column_names
            all.each do |employee|
                csv << employee.attributes.values_at(*column_names)
            end
        end
    end

end