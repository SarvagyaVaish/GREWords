class AddColumnModeToProgresses < ActiveRecord::Migration
  def change
    add_column :progresses, :mode, :integer
  end
end
