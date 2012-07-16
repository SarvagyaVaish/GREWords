class CreateWordLists < ActiveRecord::Migration
  def change
    create_table :word_lists do |t|
      t.integer :user_id
      t.string :list_type
      t.string :name

      t.timestamps
    end
  end
end
