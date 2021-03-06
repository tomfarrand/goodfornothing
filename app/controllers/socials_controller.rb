class SocialsController < ApplicationController

  respond_to :html
  
  before_filter :fetch_social, :only => [:show, :attend, :attending]
  before_filter :authenticate_user!, :only => [:attend, :attending]

	def show
	  
	  @attendees = @social.users.where('users.id NOT IN (?)', @social.chapter.users.crew.map(&:id).join(','))

	end
	
	def attend

    location = social_path(@social)

	  if @social.users.include?(current_user)
	    slot = current_user.slots.select { |item| item.social_id == @social.id }.first	    
      slot.users.delete(current_user)
      flash[:notice] = "You are no longer attending this social."
    else
      slot = (params[:slot].nil?) ? @social.slots.first : Slot.find(params[:slot])
      slot.users << current_user
      location =  social_path(@social)
    end
  
    redirect_to location
    
	end
	
	private
	
	  def fetch_social
	    @social = Social.find(params[:id])
	  end

end
