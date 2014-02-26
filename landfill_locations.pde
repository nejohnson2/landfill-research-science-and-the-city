/*
  A Landfill Near You 
  by Nicholas Johnson
  
  This sketch is designed to upload a csv containing latitude and longitude
  of landfills on the EPA Watchlist. Following the upload, using google 
  maps, will take an image of the area and output to a specified folder.
  
  A section of code will also place the latitude and longitude onto the image.
  Though the csv contains over nine thousand rows, my hope is to crowdsource
  the resulting images to determine what is interesting, are there actually
  landfills at these location and other general information that could be gathered
  in the future.  This will most likely be done through Crowdcrafting.
  
  This code was derived from Josh Begley's Prison Map project. 
 
*/

String[] landfills;
String outputPath;
String outputPathAbsolute = "/Users/Luce/Documents/Processing/landfill_locations/imagery-media-latlon"; //change to file location
Boolean initiate = false;
String inputFile;
PGraphics pg;
int zoom = 14; // set google map zoom level - lower number means farther away

void setup() {
  size(640,640); 
  //selectInput("Select a file to process:", "fileSelected");  // allows a popup so you can choose the file instead of hardcoding
  initiate = true;
  textFont(createFont("Georgia", 24));
  pg = createGraphics(640,640); // max size for google
}

void draw() {
  if(initiate == true){

    //landfills = loadStrings(inputFile); // if using input method
    //landfills = loadStrings("epa_landfills.csv");
    landfills = loadStrings("MEDIA_LATLON.csv"); // file that contains the lat/lon
    
    for(int i = 1226; i < landfills.length; i++) {  
      String[] values = split(landfills[i], ",");  // This loads the whole csv seperated by commas
      println(landfills.length);
      String lat = values[1]; // this pulls the individual item
      String lon = values[2]; // this pulls the individual item
      String na = "NA";
      
      println(i+ "- " + lat + ", " + lon);  // for debuging
      
      if(lat.equals(na) == true){
        println("no lat lon");
      } else {
        PImage test = getSatImage(lat,lon);
        
        //********************* Print Lat lon on Image ******************//
        // this is how I know where each landfill image is actually located.
        
        pg.beginDraw();
        pg.background(test);
        pg.fill(0, 140);
        pg.rect(0, 595, 200, 150);
        pg.fill(255,255,255);
        pg.textSize(18);
        pg.text("Lat : " + lat, 5, 615);
        pg.text("Lon : " + lon, 5, 635);
        pg.endDraw();
        image(pg,0,0);
        pg.save(outputPathAbsolute + "/landfill-" + i + "-zoom-" + zoom + ".jpg");
        
      }
      delay(1000); // Wait one second.  Google freaks out if you try to do it faster
    }
  }
}

// Makes a request to google maps to get an image based on lat lon
PImage getSatImage(String lat, String lon) {
    String url = "http://maps.googleapis.com/maps/api/staticmap?center=" + lat + "," + lon + "&zoom=" + zoom + "&scale=1&size=640x640&maptype=satellite&sensor=false&junk=.jpg";
    println(url);
    return(loadImage(url));
}

// Select the output folder
void folderSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    outputPath = selection.getAbsolutePath();
    initiate = true;
  }
}

// Choose input file
void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    inputFile = selection.getAbsolutePath();
  }
  selectFolder("Select a folder to save images:", "folderSelected");
}
