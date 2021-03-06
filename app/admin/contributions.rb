ActiveAdmin.register Contribution do
  
  menu :priority => 3, :parent => "Challenges"
   
  config.clear_sidebar_sections!
  
  actions :all, :except => [:new]
  
	index do
	  column :challenge
	  column :skill
    column :user
    default_actions
  end
  
  show do |idea|
    attributes_table do
      row :accepted
      row :user
      row :challenge
      row :skill
      row :description
      row :url
    end
  end
  
  form do |f|
    f.inputs "Status" do
      f.input :accepted
    end
    f.inputs "Details" do
      f.input :user
      f.input :challenge
      f.input :skill
      f.input :url
      f.input :description
    end
    f.buttons
  end
  
end
