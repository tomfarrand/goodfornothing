ActiveAdmin.register Skill do
  
  menu :priority => 4, :parent => "Events"

  config.clear_sidebar_sections!

  index do 
    column :title
    default_actions
  end

  show do |skill|
    attributes_table do
      row :title
    end
  end
  
end
