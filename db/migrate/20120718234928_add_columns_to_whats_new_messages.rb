class AddColumnsToWhatsNewMessages < ActiveRecord::Migration
  def change
    add_column :whats_new_messages, :text, :string
    add_column :whats_new_messages, :user_specific, :boolean
    add_column :whats_new_messages, :expiration_date, :datetime
  end
end
