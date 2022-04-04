ActiveAdmin.register Post do
  permit_params :title, :body, :user_id

  index do
    selectable_column
    id_column
    column "User" do |user|
      user.user.email
    end
    column :title
    column :body
    actions
  end

  show do
    attributes_table do
      row "Id" do |p|
        p.id
      end
      row "User" do |user|
        user.user.email
      end
      row :title
      row :body
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs "Post" do
      f.input :user,
        as: :select,
        collection: User.pluck(:email, :id),
        input_html: { disabled: f.object.persisted? }
      f.input :title
      f.input :body
    end
    f.actions
  end
end
