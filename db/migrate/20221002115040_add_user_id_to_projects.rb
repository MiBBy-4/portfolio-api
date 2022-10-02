# frozen_string_literal: true

class AddUserIdToProjects < ActiveRecord::Migration[7.0]
  def change
    add_reference :projects, :users, null: false, foreign_key: true, default: User.where('is_admin', true).first.id
  end
end
