class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # before_action :store_user_location!, if: :storable_location?, only: :update
  # before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(resource)
    # return the path based on resource
    if current_user.incident.nil?
      sign_out current_user
      flash[:notice] = "Votre dossier a été récemment supprimé."
      return root_path
    else
      return incident_path(current_user.incident)
    end
  end

  def after_update_path_for(resource)
    stored_location_for(resource) || super
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  #   def configure_permitted_parameters
  #   # For additional in app/views/devise/registrations/edit.html.erb
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address, :city, :phone_number])
  # end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  # def storable_location?
  #    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  #  end

  # def store_user_location!
  #     # :user is the scope we are authenticating
  #     store_location_for(:user, request.fullpath)
  # end

end
