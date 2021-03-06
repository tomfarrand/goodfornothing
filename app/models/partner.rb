class Partner < ActiveRecord::Base
  
  attr_accessible :name, :url, :logo, :active, :purpose, :contact, :notes

  has_many :gigs
  has_many :challenges
  
  validates_presence_of :name
  
  mount_uploader :logo, LogoUploader
  
  before_save :check_url_scheme
  
  scope :active, where(:active => true)
  scope :inactive, where(:active => false)
	
end