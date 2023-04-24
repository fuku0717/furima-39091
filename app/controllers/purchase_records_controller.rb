class PurchaseRecordsController < ApplicationController
   before_action :authenticate_user!
   before_action :set_furima, only: [:index, :create]
   before_action :prevent_url, only: [:index, :create]

   def index
     @purchase_address = PurchaseAddress.new
   end

   def create
     @purchase_address = PurchaseAddress.new(purchase_address_params)
     if @purchase_address.valid?
        pay_item
        @purchase_address.save
        redirect_to root_path
     else
        render :index
     end
   end

   private

   def purchase_address_params
     params.require(:purchase_address).permit(:post_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
   end

   def set_furima
    @item = Item.find(params[:item_id])
  end

  def prevent_url
    if @item.user_id == current_user.id || @item.purchase_record != nil
      redirect_to root_path
    end
  end
   
   def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:price],  # 商品の値段
        card: purchase_address_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
   end

end