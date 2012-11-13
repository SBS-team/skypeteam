class CreateOriginalTexts < ActiveRecord::Migration
  def change
    create_table :original_texts do |t|
      t.text :body
      t.date :workday_date
      t.boolean :status

      t.timestamps
    end
  end
end
