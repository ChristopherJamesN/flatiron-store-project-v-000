class StoreController < ApplicationController
  def index
    @categories = Category.all
    @items = Item.all
    if user_signed_in?
      @user = User.find(current_user)
      @cart = current_user.current_cart
    end
  end
end
