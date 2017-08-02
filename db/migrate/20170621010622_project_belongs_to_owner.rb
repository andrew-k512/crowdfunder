class ProjectBelongsToOwner < ActiveRecord::Migration[5.1]
  def change
    add_reference :projects, :owner, references: :users
  end
end
