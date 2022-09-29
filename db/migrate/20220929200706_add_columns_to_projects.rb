class AddColumnsToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :start_date, :datetime
    add_column :projects, :finish_date, :datetime
    add_column :projects, :repository_link, :string
  end
end
