import json,urllib.request

from pythonosc import udp_client

# send data to local computer on port 12000
ip, port = '127.0.0.1', 12000

client = udp_client.SimpleUDPClient(ip, port)

# get data from the web json file
data = urllib.request.urlopen("http://fezz.in/whg/projects/data/tube-stops.json").read()
output = json.loads(data)

# save station names into keys list
keys =[]

for key in output.keys():
# save location data into lat and lon lists
    lat = output[key]['lat']
    lon = output[key]['lon']

# send three lists to server
    loc = [lat,lon,key]
    client.send_message("/lat", loc)
