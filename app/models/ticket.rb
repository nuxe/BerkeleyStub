class Ticket < ActiveRecord::Base
  attr_accessible :price, :seat
  belongs_to :event
  belongs_to :user
  def add(price, seat, eventid, userid)
  	foundEvent=Event.where(:id => eventid, :limit => 1)
  	foundUser=User.where(:id => userid, :limit => 1)
  	if ((foundEvent.nil? == true) or (foundUser.nil? == true))
  		return 0
  	end
  	ticket=Ticket.new
  	ticket.event_id=eventid
  	ticket.user_id=userid
  	ticket.price=price
  	ticket.seat=seat
  	ticket.save
  	return 1
  end
end
