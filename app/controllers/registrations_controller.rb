class RegistrationsController < Devise::RegistrationsController

  def create
    if verify_recaptcha
      super
    else
      build_resource(sign_up_params)
      clean_up_passwords(resource)
      flash.now[:alert] = "There was an error with the recaptcha code below. Please re-enter the code."
      flash.delete :recaptcha_error
      render :new
    end
  end

  def edit
    if params[:change_password]
      render :change_password
    else
      super
    end
  end

  protected

  def update_resource(resource, params)
    unless [params[:password]]
      params.delete(:current_password)
      resource.update_without_password(params)
    else
      resource.update_attributes(params)
    end
  end
  
end
