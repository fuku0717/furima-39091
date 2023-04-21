class PurchaseRecordsController < ApplicationController
   before_action :authenticate_user!

   def index
     @item = Item.find(params[:item_id])
     @purchase_address = PurchaseAddress.new
   end

   def create
     @item = Item.find(params[:item_id])
     @purchase_address = PurchaseAddress.new(purchase_address_params)
     if @purchase_address.valid?
        @purchase_address.save
        redirect_to root_path
     else
        render :index
     end
   end

   private

   def purchase_address_params
     params.require(:purchase_address).permit(:post_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: @item.id)
   end
   
end