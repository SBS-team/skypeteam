ActiveAdmin.register Message do
  index do
    column :id
    column :workday
    column :member
    column :body
    column :updated_at
    column :created_at
    default_actions
  end
end
