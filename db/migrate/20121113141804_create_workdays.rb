class CreateWorkdays < ActiveRecord::Migration
  def change
    create_table :workdays do |t|
      t.string :skype_date
      t.datetime :timestamp

      t.timestamps
    end
  end
end
