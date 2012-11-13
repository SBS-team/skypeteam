class AddWorkdayIdToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :workday_id, :integer
  end
end
