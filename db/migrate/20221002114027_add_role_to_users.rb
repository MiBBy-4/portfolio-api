# frozen_string_literal: true

class AddRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_admin, :boolean, default: 0
  end
end
