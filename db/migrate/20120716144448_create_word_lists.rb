class CreateWordLists < ActiveRecord::Migration
  def change
    create_table :word_lists do |t|
      t.integer :user_id
      t.integer :word_id
      t.string :type
      t.string :name

      t.timestamps
    end
  end
end
