class RenameListContentsColumns < ActiveRecord::Migration
  def up
    rename_column :list_contents, :word_list_id, :list_id
  end

  def down
  end
end
