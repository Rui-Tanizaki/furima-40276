class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    puts "API Key: #{ENV["PAYJP_SECRET_KEY"]}"
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    item_id = params[:item_id]
    @item = Item.find(item_id)
    @order = Order.new
  
    if @item.sold_out?
      redirect_to root_path
    elsif current_user == @item.user
      redirect_to root_path
    else
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order = Order.new(order_params)
    @order.user = current_user 
    @order.item = Item.find(params[:furima_id]) 
    if @order.save  
      create_user_item
      pay_item
      @order.item.update(sold_out: true) 
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      @item = Item.find(params[:furima_id]) 
      render :index, status: :unprocessable_entity
    end
  end

  private

  def pay_item
    Payjp.api_key  = ENV["PAYJP_SECRET_KEY"] 
    begin
      charge = Payjp::Charge.create(
        amount: @order.item.item_price,
        card: order_params[:token],
        currency: 'jpy'
      )
    end
  end

  def create_user_item
    user_item_params = {
      nickname: current_user.nickname,
      item_name: @order.item.item_name,
      price: @order.item.item_price
    }
    UserItem.create(user_item_params.merge(order_id: @order.id))  
  end

  def user_items_params
    params.permit(:nickname,:item_name,:price).merge(order_id: @order.id)
  end
  
  def order_params
    params.require(:order).permit(:order_postcode, :prefecture_id, :order_city, :order_address, :order_building, :order_phone_number).merge(token: params[:token])
  end

end