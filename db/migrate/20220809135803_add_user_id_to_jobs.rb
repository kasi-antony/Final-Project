# frozen_string_literal: true

class AddUserIdToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :user_id, :bigint
  end
end
