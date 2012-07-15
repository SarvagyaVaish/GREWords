class RemoveColumnFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :hashed_password
  end

  def down
  end
end
