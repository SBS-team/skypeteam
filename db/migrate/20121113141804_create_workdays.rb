class CreateWorkdays < ActiveRecord::Migration
  def change
    create_table :workdays do |t|
      t.date :skype_date
      t.integer :original_text_id
      t.integer :messages_count

      t.timestamps
    end
  end
end
