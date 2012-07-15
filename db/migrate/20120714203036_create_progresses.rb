class CreateProgresses < ActiveRecord::Migration
  def change
    create_table :progresses do |t|
      t.integer :user_id
      t.integer :word_id
      t.integer :points

      t.timestamps
    end
  end
end
