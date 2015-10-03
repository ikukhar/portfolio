class RegistrationsController < Devise::RegistrationsController

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
