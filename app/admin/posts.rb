ActiveAdmin.register Post do
  permit_params :title, :content, :user_id

  index do
    selectable_column
    id_column
    column "User" do |p|
      p.user.email
    end
    column :title
    column "Content" do |p|
      raw p.content
    end
    actions
  end

  show do
    attributes_table do
      row "Id" do |p|
        p.id
      end
      row "User" do |p|
        p.user.email
      end
      row :title
      row "Content" do |p|
        raw p.content
      end
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
      # f.input "content" do |p|
      #   p
      # end
      f.input :content, as: :quill_editor,
        input_html:
          { data:
            { options:
              { modules:
                { toolbar:
                  [
                    ["bold", "italic", "underline"],
                    [
                      { "list": "ordered" },
                      { "list": "bullet" }
                    ],
                    ["link", "image"]
                  ]
                },
                placeholder: "Write some description here...",
                theme: "snow"
              }
            }
          }
    end
    f.actions
  end
end
