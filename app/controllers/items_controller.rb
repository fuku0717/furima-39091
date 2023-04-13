class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :price, :user)
  end

end