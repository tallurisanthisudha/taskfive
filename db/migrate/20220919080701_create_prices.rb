class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.float :bitcoin_price

      t.timestamps
    end
  end
end
