ActiveAdmin.register Bookmark, :as => "Warbles" do
  
  menu :priority => 3, :parent => "Conversations"
  
  config.clear_sidebar_sections!
  
  form :html => { :enctype => "multipart/form-data" }  do |f|
    f.inputs "State" do
      f.input :published
    end
    f.inputs "Content" do
      f.input :title, :as => :string
      f.input :url, :as => :string
      f.input :description, :input_html => { :rows => 10 }
      f.input :hero_image
    end
    f.inputs "Warblings" do
      f.input :warblings, :as => :check_boxes
    end
    f.inputs "Tags" do
      f.input :tags, :as => :check_boxes
    end
    f.buttons
  end
  
	index do
    column :title
    default_actions
  end
  
  show do |bookmark|
    attributes_table do
      row "Published" do 
        (bookmark.published) ? "Yes" : "No"
      end
      row :title
      row "URL" do
        link_to bookmark.url, bookmark.url
      end
      row :description
      row :hero_image do
        image_tag(bookmark.hero_image.thumbnail) unless bookmark.hero_image.url.nil?
      end
      row "Warblings" do |i|
        i.warblings.map{ |w| w.title }.join(', ')
      end
      row "Tags" do |i|
        i.tags.map{ |w| w.title }.join(', ')
      end
    end
  end
  
  member_action :publish do
    bookmark = Bookmark.find(params[:id])
    bookmark.published = true
    bookmark.save
    redirect_to admin_dashboard_path
  end
  
end
