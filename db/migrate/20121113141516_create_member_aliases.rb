class CreateMemberAliases < ActiveRecord::Migration
  def change
    create_table :member_aliases do |t|
      t.integer :member_id
      t.string :real_name

      t.timestamps
    end
  end
end
