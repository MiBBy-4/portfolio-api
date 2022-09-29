class RenameNameToProjects < ActiveRecord::Migration[7.0]
  def change
    rename_column :projects, :name, :title
  end
end
