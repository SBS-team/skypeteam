class CreateWorkdays < ActiveRecord::Migration
  def change
    create_table :workdays do |t|
      t.string :skype_date
      t.string :timestamp

      t.timestamps
    end
  end
end
