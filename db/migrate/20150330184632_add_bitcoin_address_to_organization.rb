class AddBitcoinAddressToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :bitcoin_address, :string
  end
end
