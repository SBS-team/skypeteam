ActiveAdmin.register MemberAlias do
  index do
    column :id
    column :member
    column :real_name
    column :updated_at
    column :created_at
    default_actions
  end
end
