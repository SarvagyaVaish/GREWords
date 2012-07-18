class ChangeWordListTableNameToLists < ActiveRecord::Migration
  def up
    rename_table :word_lists, :lists
  end

  def down
  end
end
