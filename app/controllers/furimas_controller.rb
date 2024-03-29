class FurimasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :destroy]

  def index
    @items = Item.order(created_at: :desc)
    @user_items = UserItem.where(item_id: @items.pluck(:id))
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id if current_user
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
    @user_item = UserItem.find_by(item_id: @item.id)
  end

  def edit
    @item = Item.find(params[:id])

    redirect_to root_path if @item.sold_out?

    return unless current_user != @item.user

    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to furima_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user != @item.user
      redirect_to root_path
    else
      @item.destroy
      redirect_to root_path
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :item_price, :item_category_id, :item_sales_status_id,
                                 :item_shipping_fee_status_id, :prefecture_id, :item_scheduled_delivery_id)
  end
end
