class CreateRewards < ActiveRecord::Migration[4.2]
  def change
    create_table :rewards do |t|
      t.belongs_to :project
      t.string :description
      t.integer :amount

      t.timestamps
    end
  end
end
