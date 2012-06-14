class Chapter < ActiveRecord::Base

	has_many :gigs
	has_many :posts, :class_name => "::Blog::Post"
  has_many :users

	attr_accessible :title, :city, :country, :user_ids
	
	validates_presence_of :title
	
	def slug
	  self.title.downcase
	end

end
