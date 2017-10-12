class CartsController < ApplicationController
  def show
    if user_signed_in?
      @current_cart = current_user.current_cart
    end
  end


  def checkout
    @current_cart = current_user.current_cart
    @current_cart.line_items.each do |line_item|
      item = Item.find(line_item.item_id)
      item.update(inventory: item.inventory - line_item.quantity)
    end
    @current_cart.destroy
    redirect_to "/carts/#{@current_cart.id}"
  end
end
