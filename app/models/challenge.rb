class Challenge < ActiveRecord::Base

  attr_accessible :gig_id, :title, :description, :venture_id, :contact, :partner_id,
                  :bookmark_ids, :warbling_ids, :featured, :active, :open
                  
	belongs_to :gig
	belongs_to :venture
	belongs_to :partner
	
	has_and_belongs_to_many :warblings		
	has_and_belongs_to_many :bookmarks
	
	has_many :ideas
	has_many :contributions
	
	extend FriendlyId
  friendly_id :title, use: :slugged
  
  validates_presence_of :title
	
	scope :active, where(:active => true)
  scope :inactive, where(:active => false)
  scope :opened, where(:active => true, :open => true)
  scope :closed, where(:active => true, :open => false)
		
	def team
    User.includes(:contributions,:ideas).where('contributions.challenge_id = ? or ideas.challenge_id = ?',self.id,self.id)
  end
		
end