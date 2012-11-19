ActiveAdmin.register OriginalText do
  menu :parent => "Site edit"
  index do
    column :id
    column :status
    column :messages_count
    column :workday_date
    column :updated_at
    column :created_at
    default_actions
  end
  form do |f|
    f.inputs "Details" do
      f.input :workday_date
      f.input :body, :label => raw("<strong>Body :</strong></br><pre>Put instead time:\n#{OriginalText::TYPE_OF_CONTENT.keys.join("\n").to_s} </pre>")
      f.input :parsed_body
    end
    f.buttons
  end

  show do
    attributes_table do
      row :id
      row :status
      row :messages_count
      row :workday_date
      row :updated_at
      row :created_at
    end
    panel "Origin", :style => "float:left; width: 50%" do
      div do
        simple_format original_text.body
      end
    end

    panel "Will be", :style => "float:left; width: 50%" do
      div do
        original_text.parsed_body.each do |mes|
          div do
            if ma = MemberAlias.find_by_member_id(mes[:member_id])
              pre(:style => "margin: 0;") do
                html = "#{ma.real_name}(#{ma.member.try(:name)}):"
                raw(html << show_with_type(mes[:body],mes[:body_type].to_s))
              end
            elsif !mes[:body].blank?
              span(:style => "color:red; float:left") do
                "NONAME:"
              end
              pre(:style => "width:90%; float:left;margin: 0;") do
                show_with_type(mes[:body],mes[:body_type].to_s)
              end
              div(:style => "clear: both;")
            end
          end
        end
      end
    end
    div :style => "clear:both"
    active_admin_comments
  end

  action_item :only => [:show, :edit] do
    link_to('Show on site', public_admin_original_text_path(original_text), :method => :post, :confirm => "Are you sure?")
  end

  member_action :public, :method => :post do
    OriginalText.find(params[:id]).create_messages
    redirect_to admin_workdays_path, :notice => "Success"
  end

end
