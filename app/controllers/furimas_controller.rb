class FurimasController < ApplicationController
  before_action :authenticate_user!,except: [:index]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    if current_user.nil?
      flash[:alert] = "ログインしてください。"
      redirect_to new_user_session_path
      return
    end

    @item = Item.new(item_params.merge(user_id: current_user.id))
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :item_price, :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id, :prefecture_id, :item_scheduled_delivery_id)
  end
end