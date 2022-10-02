# frozen_string_literal: true

class RemoveDefaultUserIdFromProjects < ActiveRecord::Migration[7.0]
  def change
    def change
      def up
        change_column_default :projects, :user_id, from: User.where('is_admin', true).first.id, to: nil
      end

      def down
        change_column_default :projects, :user_id, from: nil, to: User.where('is_admin', true).first.id
      end
    end
  end
end
