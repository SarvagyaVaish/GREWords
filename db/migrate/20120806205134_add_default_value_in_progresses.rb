class AddDefaultValueInProgresses < ActiveRecord::Migration
  def up
    change_column_default(:progresses, :points, 0)
  end

  def down
  end
end
