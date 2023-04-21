require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  describe '商品購入記録の保存' do
    before do
       @user = FactoryBot.create(:user)
       @item = FactoryBot.create(:item)
       @shipping_address = FactoryBot.build(:shipping_address,user: @user.id, item: @item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@shipping_address).to be_valid
      end
      it '建物名が空でも購入できること' do
        @shippingaddress.building_name = ''
        expect(@shipping_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号は空では保存できないこと' do
        @shipping_address.post_code = ''
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号は『３桁ハイフン４桁』半角英数字でないと保存できないこと' do
        @shipping_address.post_code = '123-123４'
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県に「---」が選択されている場合は購入できないこと' do
        @shipping_address.prefecture_id = '1'
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと購入できないこと' do
        @shipping_address.municipalities = ''
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空だと購入できないこと' do
        @shipping_address.address = ''
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと購入できないこと' do
        @shipping_address.telephone_number = nil
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '電話番号が9桁以下だと購入できないこと' do
        @shipping_address.telephone_number = '090123456'
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it '電話番号が12桁以上だと購入できない' do
        @shipping_address.telephone_number = '090123456789'
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it '電話番号が半角数値でないと購入できないこと' do
        @shipping_address.telephone_number = '０9012341234'
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'tokenが空では購入できないこと' do
        @shipping_address.token = nil
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐づいていなければ購入できないこと' do
        @shipping_address.user = ''
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていなければ購入できないこと' do
        @shipping_address.item = ''
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end