ActiveAdmin.register Warbling do
  
  menu :priority => 1, :parent => "Conversations"
   
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
