class User < ActiveRecord::Base
  has_one :employee

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :timeoutable, password_length: 6..128
         
  def timeout_in
    if self.admin? 
      2.hours
    else
      1.hour
    end
  end 
  
  
end
