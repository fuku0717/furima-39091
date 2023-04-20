class CreatePurchaseRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_records do |t|
      t.references :user
      t.references :item

      t.timestamps
    end
  end
end
