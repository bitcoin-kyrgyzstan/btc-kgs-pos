class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :organization
      t.decimal :amount
      t.string :luid
      t.decimal :btc_kgs_exchange_rate
      t.timestamps null: false
    end
  end
end
