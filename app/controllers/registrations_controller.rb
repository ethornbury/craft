class RegistrationsController < Devise::RegistrationsController
  protected
  
  def new
    super
  end

  def create
    # add custom create logic here
  end

  def update
    super
  end
  
  def after_sign_up_path_for(user)
    'employees/new'
  end
end