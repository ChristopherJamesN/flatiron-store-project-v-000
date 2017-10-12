class LineItemsController < ApplicationController

  def create
    @user = User.find(current_user)
    if @user.current_cart != nil
      @cart = @user.current_cart
      @cart.add_item(params[:item_id]).save
      @cart.save
    else
      @cart = Cart.create(user_id: @user.id)
      @cart.add_item(params[:item_id]).save
      @cart.save
      @user.carts << @cart
      @user.current_cart = @cart
      @user.save
    end
    redirect_to cart_path(@cart)
  end


end
