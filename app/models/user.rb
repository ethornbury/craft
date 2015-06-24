class User < ActiveRecord::Base
  has_one :employee
  # this links the user to the employee 
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :timeoutable, password_length: 6..128
         
  def timeout_in
    #admin time out is 2hrs, all others is 1hr
    #if you abandon the application, your session will be closed
    #and you will need to sign in again, more secure
    if self.admin? 
      2.hours
    else
      1.hour
    end
  end 
  
  
end
