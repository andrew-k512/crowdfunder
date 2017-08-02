class AddProjectIdToPledges < ActiveRecord::Migration[5.1]
  def change
    remove_reference :pledges, :reward, index: true, foreign_key: true
    add_reference :pledges, :project, foreign_key: true
  end
end
