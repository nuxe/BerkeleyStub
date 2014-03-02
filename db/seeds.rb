# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'httparty'
response = HTTParty.get('http://ws.audioscrobbler.com/2.0/?method=geo.getevents&location=san%20francisco&limit=20&distance=50&api_key=9ee648668917089ea44446629bac6805&format=json')
data = JSON.parse(response.body)
events = data['events']['event']

for e in events
	Event.create(name: e['title'], location: e['street'], date: e['startDate'])
end
