# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
    return unless Cart.exists?(session[:cart_id])

    cart_from_session = Cart.find(session[:cart_id])
    if current_user.cart
      cart_from_session.cart_details.each do |cart_detail|
        current_user.cart.cart_details << cart_detail
      end
      cart_from_session.destroy
    else
      current_user.cart = cart_from_session
    end
    session[:cart_id] = nil
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
