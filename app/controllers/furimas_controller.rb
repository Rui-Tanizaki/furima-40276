class FurimasController < ApplicationController
  before_action :authenticate_user!,except: [:index]
  def index
    @items = Item.includes(:user)
    @articles = Article.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item.image.purge if @item.image.attached?
      @item.item_price = nil
  
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :item_price, :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id, :prefecture_id, :item_scheduled_delivery_id).merge(user_id: current_user.id)
  end

end