class AddPointsToListContents < ActiveRecord::Migration
  def change
    add_column :list_contents, :points, :integer
  end
end
