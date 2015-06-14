class StaticPagesController < ApplicationController
  before_action :authenticate_user!, except: [:home, :contact, :about]
  # only authenticated users can access pages other than those specified above.
  def home
  end

  def about
  end

  def contact
  end
  
  def manager
  end 
end
