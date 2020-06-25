# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_cart
    @cart = Cart.find_or_create_by(id: session[:cart_id])
    session[:cart_id] = @cart.id
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:screen_name])
  end
end
