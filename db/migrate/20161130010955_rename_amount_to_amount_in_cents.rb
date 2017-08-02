class RenameAmountToAmountInCents < ActiveRecord::Migration[5.0]
  def change
    rename_column :rewards, :amount, :amount_in_cents
  end
end
