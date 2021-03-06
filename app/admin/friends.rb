ActiveAdmin.register Friend do
  
  menu :priority => 3, :parent => "Community"
  
  config.clear_sidebar_sections!
  
  index do
    column :name
    default_actions
  end
  
  show do |friend|
    attributes_table do
      row :name
      row :description
      row "Website" do
        friend.url unless friend.url.nil?
      end
      row :logo do
        image_tag(friend.logo.url) unless friend.logo.url.nil?
      end
    end
  end
  
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :url, :label => "Website"
      f.input :description
      f.input :logo
    end
    f.buttons
  end
  
end