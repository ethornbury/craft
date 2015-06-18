class StaticPagesController < ApplicationController
  before_action :authenticate_user!, except: [:home, :contact, 
                :about, :show_pdf,
                :download_pdf]
  
  def home
  end

  def about
  end

  def contact
  end
  
  def manager
  end
  def show_pdf
    #pdf_filename = File.join(Rails.root, "public/sample.pdf") #this option didn't work
    send_file("#{Rails.root}/public/craftwork-app.pdf",        #pdf_filename, 
        :filename => "craftwork-app.pdf", 
        :disposition => 'inline', 
        :type => "application/pdf")
  end
  
  def download_pdf
    send_file("#{Rails.root}/public/craftwork-app.pdf",
      filename: "craftwork-app.pdf",
      type: "application/pdf"
    )
  end 
end
