class PurchaseRecordsController < ApplicationController
  # before_action :authenticate_user!
  # def index
  #   @purchase_records = ShippingAddress.new
  #   @items = Item.find(params[:item_id])
  # end
  # def create
  #   @items = Item.find(params[:item_id])
  #   @purchase_records = ShippingAddress.new(purchase_record_params)
  #   if @purchase_records.valid?
  #     @purchase_records.save
  #     redirect_to root_path
  #   else
  #     render action: :index
  #   end
  # end

  # private

  # def purchase_record_params
  #   params.require(:shipping_address).permit(:post_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  # end
end