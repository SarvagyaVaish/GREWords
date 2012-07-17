class CreateListContents < ActiveRecord::Migration
  def change
    create_table :list_contents do |t|
      t.integer :word_list_id
      t.integer :word_id

      t.timestamps
    end
  end
end
