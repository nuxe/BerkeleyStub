import urllib2
import json

url = "http://ws.audioscrobbler.com/2.0/?method=geo.getevents&location=san%20francisco&distance=50&api_key=9ee648668917089ea44446629bac6805&format=json"
req = json.load(urllib2.urlopen(url))
print req['events']['event'][0]

