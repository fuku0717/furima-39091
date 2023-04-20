class PurchaseRecordsController < ApplicationController
   before_action :authenticate_user!

   def index
     @items = Item.find(params[:item_id])
     @shipping_address = ShippingAddress.new
   end

   def create
     @items = Item.find(params[:item_id])
     @shipping_address = ShippingAddress.new(shipping_address_params)
     if @shipping_address.valid?
        @shipping_address.save
        redirect_to root_path
     else
        render :index
     end
   end

   private

   def shipping_address_params
     params.require(:shipping_address).permit(:post_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
   end
   
end