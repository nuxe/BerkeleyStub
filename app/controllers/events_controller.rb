class EventsController < ApplicationController
	def home
		@events= Event.all
	end

	def login
	end

	def add
	end

	def eventView
	end

	def createTicket
		render 'ticketForm'
	end

	def addTicket
		price=user_params[:price]
		seat=user_params[:seat]
		event=user_params[:event]
		user=user_params[:user]
		t=Ticket.new
		check=t.add(price, seat, event, user)

	end

	def user_params
      params.permit(:price, :seat, :eventid, :userid)
    end
end
