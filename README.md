###Science and the City Hackfest - Landfill Research
This repo contains various information and research which has been conducted to understand landfills in the United States.  The main goal of this project is to capture images of all the landfills in the country, and use Crowdcrafting to calculate the total area of all landfills in the United States.

The methodology here is to use location/landfill information from the EPA and use a Processing sketch to take images from Google Maps.  These images could then be uploaded into Crowdcrafting where users could outline the landfill to calculate the total area of all landfills in the United States.


####EPA Database

The EPA has a database located online which contains information related to all facilities responsible for working with Municipal Solid Waste.  These facilities can be identifyed by using a the SIC code 4953.  This repo however already contains a .csv file which includes all of the landfill facilities.  The epa_landfills.csv file has already been cleaned and is read to be analyzed and further understood.

The file itself contains address, Lat/Lon location, city, state, days since last inspection and much more.  There are many columns however which I do not fully understand what they represent.  Any research to better understand how these columns are collected and what exactly the data represents would be fantastic.

EPA Database: http://echo.epa.gov/?redirect=echo

####Processing Sketch

The processing sketch in this repo takes the latitude and longitutde information from the epa_landfills.csv data set and takes a 640x640 snapshot from Google maps.  The idea here is to actually take pictures of all the landfills from Google Maps.  The processing sketch returns individual jpeg images which are stored in the /imagery and /imagery-media-latlon folders.  

####Challenges

1) The location information from the EPA database is not always directly where the landfill is located.  Often the location is of an office building while the landfill is down the street.  This means that not all images taken with the Processing sketch will contain a landfill.  

2) Using Crowdcrafting to outline landfills in order to get area.  I have no experience doing this.  Also, scale is very important.  Something which I have not resolved yet.

3) The Processing sketch takes a long time to run and there is a limit to how many images you can take in Google Maps for a given time period.  I've estimated its about 200 for 8 hours.  If anyone knows this it would be incredible helpful.  This is based off you IP address therefore if you wish to capture more images, you need to move to different locations.

####Goals for the Hackfest

1) __Research what the EPA data set means.__ There are many columns which are non-descriptive.  To have a document or resource which accurately describes these columns would be very useful.

2) __Capture more images from a different scale.__  Since the current zoom level does not always capture a landfill, it would be useful to know which landfills are not directly related to the lat/lon supplied in the csv file.  (I also do not know the difference between media lat/lon and LRT lat/lon)

3) __Any analysis from the EPA dataset.__  Which states have the most landfills?  Which landfills are fined the most?  What is the average fine of a landfill?  What is the inspection rate? etc...

4) __Make an infographic for the 'most beautiful' landfills.__ Aerial imageery of landfills is amazing.  Any images captured that showcase this would be interesting.

5) __Something crazy and ridiculous that I havent thought of.__

6) __Would be great to write a blog post__ This could be hosted on the Open Trash Lab webpage.  www.opentrashlab.com  I would be happy to post it on behalf of anyone.
