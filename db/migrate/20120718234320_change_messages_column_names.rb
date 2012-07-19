class ChangeMessagesColumnNames < ActiveRecord::Migration
  def up
    rename_column :whats_new_messages, :message, :title
    remove_column :whats_new_messages, :status
  end

  def down
  end
end
