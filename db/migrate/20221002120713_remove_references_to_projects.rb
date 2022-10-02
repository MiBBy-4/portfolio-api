class RemoveReferencesToProjects < ActiveRecord::Migration[7.0]
  def change
    remove_reference :projects, :users, index: true, foreign_key: true
  end
end
