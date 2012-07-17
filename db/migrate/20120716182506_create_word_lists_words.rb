class CreateWordListsWords < ActiveRecord::Migration
  def up
    create_table :word_lists_words do |t|
      t.references :word_list
      t.references :word
    end
  end

  def down
  end
end
