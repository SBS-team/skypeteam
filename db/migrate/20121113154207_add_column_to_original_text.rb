class AddColumnToOriginalText < ActiveRecord::Migration
  def change
    add_column :original_texts, :parsed_body, :text
    add_column :original_texts, :messages_count, :integer
  end
end
