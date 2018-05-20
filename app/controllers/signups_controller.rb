class SignupsController < ApplicationController
	before_action :set_event
	skip_before_action :verify_authenticity_token 
	

	def set_event
	@event = Event.find(params[:event_id])
	end




	def new
		@event = Event.find(params[:event_id])
		@signup = Signup.new
	end


	def create
		@signup = Signup.new(signup_params)


		# check if user already signed up -- don't allow them to sign up twice


		if @signup.save
			flash[:success] = "You signed up for #{@event.title} on #{@event.date} at #{@event.time}!!"
      		redirect_to root_url

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
		redirect_to root_url
      	flash[:success] = "Nooooo!! Sorry you can't make this one, but hopefully we'll see you on another run soon!"
	end

private

def signup_params
      params.require(:signup).permit(:event_id, :user_id)
    end


end


