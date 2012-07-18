class CreateWhatsNewMessages < ActiveRecord::Migration
  def change
    create_table :whats_new_messages do |t|
      t.string :message
      t.boolean :status

      t.timestamps
    end
  end
end
