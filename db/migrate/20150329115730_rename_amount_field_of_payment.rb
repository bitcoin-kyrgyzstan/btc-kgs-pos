class RenameAmountFieldOfPayment < ActiveRecord::Migration
  def change
    rename_column :payments, :amount, :amount_in_kgs
  end
end
