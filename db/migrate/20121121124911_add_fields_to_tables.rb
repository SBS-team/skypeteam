class AddFieldsToTables < ActiveRecord::Migration
  def change
    add_column :workdays, :comments_count, :integer
    add_column :messages, :likes_count, :integer
    add_column :users, :last_url, :text
    add_column :users, :ban_reason, :text
  end
end
