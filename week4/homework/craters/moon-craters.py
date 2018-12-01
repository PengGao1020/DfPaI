import requests
from lxml import etree
import time

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

def get_coords(url):
    res = requests.get(url)

    tree = etree.fromstring(res.text, parser)
    coords = tree.xpath('//span[@class="geo"]/text()')

    return coords

def get_dia(url):
   res = requests.get(url)

   tree = etree.fromstring(res.text, parser)
   dia = tree.xpath('//tbody/tr/td[3]/text()')
   return dia

all_coords = []
all_dia = []

for url in urls:
   coords = get_coords(url)
   all_coords += coords
   dia = get_dia(url)
   all_dia += dia

   print('added {} coords'.format(len(coords)))
   print('added {} dia'.format(len(dia)))

print('total of {} coords and {} dia'.format(len(all_coords),len(all_dia)))

i=0
with open('moon_crater_coords.csv', 'w') as f:
   f.write('lat,lon,dia\n')
   for coord in all_coords:
       lat, lon = coord.split('; ')
       dia = all_dia[i]
       f.write('{},{},{}\n'.format(lat, lon, dia))
       i+=1
