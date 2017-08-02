class CreatePledges < ActiveRecord::Migration[5.0]
  def change
    create_table :pledges do |t|
      t.references :user, foreign_key: true
      t.references :reward, foreign_key: true
      t.integer :amount_in_cents

      t.timestamps
    end
  end
end
