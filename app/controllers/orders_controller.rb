class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @item_order = ItemOrder.new
  end

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:furima_id]) 
    @item_order = ItemOrder.new
    if @item.sold_out?
      redirect_to root_path
    elsif current_user == @item.user
      redirect_to root_path
    else
    end
  end

  def create
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item_order = ItemOrder.new(item_order_params)
    if @item_order.valid?
      pay_item
      item = @item_order.save
      binding.pry
      if @user_item_id == @order.item_id
        @order.item.update(sold_out: true) 
        redirect_to root_path
      else
      end

    else
      puts @item_order.errors.full_messages
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      @item = Item.find(params[:furima_id]) 
      render :index, status: :unprocessable_entity
      
    end
  end

  private

  def pay_item
    @order = Order.new
    @order.user_item = UserItem.find_by(item_id: params[:furima_id], user_id: current_user.id)
    Payjp.api_key  = ENV["PAYJP_SECRET_KEY"] 
    begin
      charge = Payjp::Charge.create(
        amount: @order.item.item_price,
        card: @item_order.token,
        currency: 'jpy'
      )
    end
  end

  def user_item_params
    params.permit(:user_id, :item_id)
  end
  
  def item_order_params
    params.require(:item_order).permit(
    :order_postcode, :prefecture_id, :order_city, :order_address, :order_building, :order_phone_number
    ).merge(user_id: current_user.id, item_id: params[:furima_id], token: params[:token])
  end
end