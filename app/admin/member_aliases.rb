ActiveAdmin.register MemberAlias do
  menu :parent => "Site edit"
  index do
    column :id
    column :member
    column :real_name
    column :updated_at
    column :created_at
    default_actions
  end
end
