class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :name
      t.string :meaning
      t.string :sentence

      t.timestamps
    end
  end
end
