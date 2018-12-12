import requests
from lxml import etree

# urls for data
urls = [
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_A%E2%80%93B',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_C%E2%80%93F',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_G%E2%80%93K',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_O%E2%80%93Q',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_R%E2%80%93S',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_T%E2%80%93Z',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_L%E2%80%93N'
]

parser = etree.HTMLParser()

# function that get coordinates and diameters from the urls link
def get_data(url):
    res = requests.get(url)
    tree = etree.fromstring(res.text, parser)
    coords = tree.xpath('//span[@class="geo"]/text()') # coordinates of craters
    dia = tree.xpath('//tbody/tr/td[3]/text()') # diameters of craters
    return coords,dia

# make two lists for different data
all_coords = []
all_dia = []

# run every url link with get_data function and add data into the lists
for url in urls:
   coords,dia= get_data(url)
   all_coords += coords
   all_dia += dia

# print how many data has been added
   print('added {} coords'.format(len(coords)))
   print('added {} dia'.format(len(dia)))

# print the final size of the lists
print('total of {} coords and {} dia'.format(len(all_coords),len(all_dia)))

# set a initial number to call data from second list inside the for loop of first list
i=0

# write data into a csv file with three columns
with open('moon_crater_coords.csv', 'w') as f:
   f.write('lat,lon,dia\n')
   for coord in all_coords:
       lat, lon = coord.split('; ')
       dia = all_dia[i]
       f.write('{},{},{}\n'.format(lat, lon, dia))
       i+=1 # so the dia list will keep moving down as for loop runs
