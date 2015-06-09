class StaticPagesController < ApplicationController
  before_action :authenticate_user!, except: [:home, :contact, :about]
  
  def home
  end

  def about
  end

  def contact
  end
  
  def manager
  end 
end
