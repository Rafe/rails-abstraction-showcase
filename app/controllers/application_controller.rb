class ApplicationController < ActionController::Base
  include ActionController::MimeResponds
  include ActionController::ImplicitRender
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    if session[:order_id].present?
      @order ||= Order.current.find_by(id: session[:order_id]) || Order.new
    else
      @order ||= Order.new
    end
  end
end
