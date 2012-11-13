class CreateOriginalTexts < ActiveRecord::Migration
  def change
    create_table :original_texts do |t|
      t.text :body
      t.datetime :workday_date
      t.boolean :status

      t.timestamps
    end
  end
end
