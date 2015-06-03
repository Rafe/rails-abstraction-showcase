module ApplicationHelper
  def current_order
    if user_signed_in?
      Order.current_order_for(current_user)
    else
      Order.new
    end
  end
end
