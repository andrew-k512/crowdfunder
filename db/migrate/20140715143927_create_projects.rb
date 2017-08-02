class CreateProjects < ActiveRecord::Migration[4.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.integer :goal
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
