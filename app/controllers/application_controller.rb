class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  helper_method :current_user, :logged_in?

  private

  def current_user
    User.find_by(id: doorkeeper_token.resource_owner_id) unless doorkeeper_token.blank?
  end

  def logged_in?
    !!current_user
  end
end
