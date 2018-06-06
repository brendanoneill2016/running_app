class StaticPagesController < ApplicationController
  

  def home
	@events = Event.all
    @event_order = Event.order(:date)

     @event_organisers = []

      @events.each do |u|
        @event_organisers << u.user_id

      end 

  end

  def help
  end

  def about
  end

  def contact
  end
  
  def archive

    @events = Event.all
    @event_order = Event.order(:date)

     @event_organisers = []

      @events.each do |u|
        @event_organisers << u.user_id

      end 
      
  end

end
