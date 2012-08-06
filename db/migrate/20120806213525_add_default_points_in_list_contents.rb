class AddDefaultPointsInListContents < ActiveRecord::Migration
  def up
    change_column_default(:list_contents, :points, 0)
  end

  def down
  end
end
