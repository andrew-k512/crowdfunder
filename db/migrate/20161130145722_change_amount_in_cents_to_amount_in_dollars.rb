class ChangeAmountInCentsToAmountInDollars < ActiveRecord::Migration[5.0]
  def change
    change_column :pledges, :amount_in_cents, :float
    change_column :rewards, :amount_in_cents, :float
    rename_column :rewards, :amount_in_cents, :dollar_amount
    rename_column :pledges, :amount_in_cents, :dollar_amount
  end
end
