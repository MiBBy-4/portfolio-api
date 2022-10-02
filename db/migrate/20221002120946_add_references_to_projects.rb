class AddReferencesToProjects < ActiveRecord::Migration[7.0]
  def change
    add_reference :projects, :user, null: false, foreign_key: true, default: User.where('is_admin', true).first.id
  end
end
