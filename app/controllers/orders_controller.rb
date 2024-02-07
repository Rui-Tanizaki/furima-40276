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
    puts "API Key: #{ENV["PAYJP_SECRET_KEY"]}"
    begin
      charge = Payjp::Charge.create(
        amount: @order.item.item_price,
        card: order_params[:token],
        currency: 'jpy'
      )
    rescue Payjp::PayjpError => e
      Rails.logger.error("Payjp API Error: #{e.message}")
      Rails.logger.error("Payjp API Error Response: #{e.response.inspect}") if e.respond_to?(:response)
      raise e  
    end
  end

  def user_items_params
    params.permit(:price).merge(user_id: current_user.id)
  end
  
  def order_params
    params.require(:order).permit(:order_postcode, :prefecture_id, :order_city, :order_address, :order_building, :order_phone_number).merge(token: params[:token])
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :item_price, :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id, :prefecture_id, :item_scheduled_delivery_id)
  end

end