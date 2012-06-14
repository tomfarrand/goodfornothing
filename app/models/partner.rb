class Partner < ActiveRecord::Base
  
  attr_accessible :name, :url, :logo

  has_many :gigs
  
  validates_presence_of :name
  
  mount_uploader :logo, LogoUploader
  
end