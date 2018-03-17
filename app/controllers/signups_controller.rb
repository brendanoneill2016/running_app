class SignupsController < ApplicationController
	before_action :set_event
	

	def set_event
	@event = Event.find(params[:event_id])
	end


	def new
		@event = Event.find(params[:event_id])
		@signup = Signup.new
	end


	def create
		@signup = Signup.new(signup_params)
		if @signup.save
			flash[:success] = "You signed up for Event #{@event.id}!!"
      		redirect_to events_url
		end
	end


	def index
	end


	def show
	end


	def destroy
		signups = @event.signups
		user_signup = signups.find_by user_id: current_user.id
		user_signup.destroy
		redirect_to events_url
      	flash[:success] = "You're officially a COMPLETE lack of Banter!! :("
	end

private

def signup_params
      params.require(:signup).permit(:event_id, :user_id)
    end


end


