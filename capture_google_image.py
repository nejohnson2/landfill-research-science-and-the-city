import requests
import shutil
import pandas as pd
import time

def readLocation():
    zoom = 14
    lat_lon = pd.read_csv('./LRT_LATLON.csv', names=['Num','lat','lon'], dtype={'Num': str})
    lat_lon[:10].apply(lambda row: buildurl(row['Num'], row['lat'], row['lon'], zoom), axis=1)
    
def buildurl(index, lat, lon, zoom):
    google_url = "http://maps.googleapis.com/maps/api/staticmap?center="
    location = str(lat) + "," + str(lon)
    zoom = "&zoom=" + str(zoom)
    scale = "&scale=1&size=640x640&maptype=satellite&sensor=false&junk=.jpg"
    url = google_url + location + zoom + scale
    data = requests.get(url, stream=True)
    writeFile(data, index)
    time.sleep(2)
	
def writeFile(response, index):
    '''
        response is the return from requests
        name is a time stamp to create a unique filename...this need work
    '''
    filePath = './' + str(index) + '.jpg'
    print "Saving file: " + filePath
    with open(filePath, 'wb') as f:
        response.raw.decode_content = True
        shutil.copyfileobj(response.raw, f) 


if __name__ == '__main__':
	readLocation()	