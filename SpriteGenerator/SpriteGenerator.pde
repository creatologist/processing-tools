//------------------------------------------------- IMPORTS
import processing.core.*;
import processing.opengl.*;



////////////////////////////////////////////////////////////////////////////////////////////////////// MODIFIERS

boolean COMBINE_JSON           = true;
boolean COMBINE_SPRITESHEETS   = false;

//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////


JSON json;


//------------------------------------------------- SETUP

void setup() {
  size( 200, 200 );
  compile();
}


//------------------------------------------------- BACKGROUND


void mousePressed() {
}

void mouseReleased() {
}
//------------------------------------------------- KEY PRESSED


void keyPressed() {
  if ( key == CODED ) {
    //println( "Keyboard CODED: " + keyCode );
    if ( keyCode == UP ) {
      compile();
    } 
    else if ( keyCode == DOWN ) {
    } 
    else if ( keyCode == RIGHT ) {
    } 
    else if ( keyCode == LEFT ) {
    }
  } 
  else {
    //println( "Keyboard KEY: " + int( key ) + " ( " + key + " )" );
  }
}


void mouseMoved() {
}

Boolean folderStructure = false;
Boolean hasFiles = false;

ImageSequence[] imageSequences;

void compile() {
  println( "" );
  println( "" );
  println( "" );
  println( "==================== compile() ====================" );
  println( "" );
  println( "" );
  
  File dir = new File(dataPath(""));
  String[] list = dir.list();
  
  if ( list != null ) {
    hasFiles = true;
  }
  
  if ( list != null ) {
    File checkDir;
    File checkFiles;
    
    int numFolders = 0;
    int numRootImages = 0;
    
    println( "---------- directory ----------" );
    //println( list );
    String s;
    for ( int i = 0, len = list.length; i < len; i++ ) {
      checkDir = new File( dataPath( list[i] ) );
      s = "[" + i + "] " + list[i];
      
      if ( checkDir.isDirectory() ) {
        println( s + " (folder)" );
        numFolders++;
      } else {
        println( s );
        numRootImages++;
      }
    }
    println( "" );
    
    String[] rootImageList;
    imageSequences = new ImageSequence[numFolders+1];
    rootImageList = new String[numRootImages];
    
    int imageSequenceCount = 0;
    int rootImageCount = 0;
    
    String[] dirListing;
    String[] parsedListing;
    
    for ( int i = 0, len = list.length; i < len; i++ ) {
      checkDir = new File( dataPath( list[i] ) );
      
      
      //println( i + " -- " +  checkDir.isDirectory() );
      if ( checkDir.isDirectory() ) {
        println( "---------- " + i + ": " + list[i] + " (folder) ----------" );
        dirListing = checkDir.list();
        int total_list_items = 0;
        for ( int j = 0, len2 = dirListing.length; j < len2; j++ ) {
          if ( dirListing[j].indexOf( "." ) != 0 ) {
            total_list_items++;
          }
        }
        
        parsedListing = new String[ total_list_items ];
        int parsed_count = 0;
        
        for ( int j = 0, len3 = dirListing.length; j < len3; j++ ) {
          if ( dirListing[j].indexOf( "." ) != 0 ) {
            parsedListing[ parsed_count ] = dirListing[j];
            parsed_count++;
          }
        }
        
        //println( parsedListing );
        
        imageSequences[imageSequenceCount] = new ImageSequence( parsedListing, list[i], true );
        imageSequences[imageSequenceCount].createJSON();
        
        imageSequenceCount++;
      } else if ( checkDir.getName().indexOf( "." ) != 0 ) {
        println( "---------- " + i + ": " + list[i] + " ----------" );
        rootImageCount++;
      }
    }
    
    rootImageList = new String[rootImageCount];
    //println( rootImageList );
    rootImageCount = 0;
    
    for ( int i = 0, len = list.length; i < len; i++ ) {
      checkDir = new File( dataPath( list[i] ) );
      if ( checkDir.isDirectory() ) {
      } else if ( checkDir.getName().indexOf( "." ) != 0 ) {
        rootImageList[ rootImageCount ] = list[i];
      }
    }
    
    
    if ( rootImageList.length > 0 ) {
      println( "" );
      println( "" );
      println( "---------- root images ----------" );
    
      imageSequences[imageSequenceCount] = new ImageSequence( rootImageList, "root" );
      imageSequences[imageSequenceCount].type = "frames";
      imageSequences[imageSequenceCount].createJSON();
      
      imageSequenceCount++;
    }
    
    
    if ( COMBINE_JSON ) {
      json = new JSON();
      json.empty();
      
      for ( int i = 0, len = imageSequenceCount; i < len; i++ ) {
        json.combine( imageSequences[i].json );
      }
      
      json.write( "output/json/combined.json" );
    }
    
  }
  
  
  
  
}

public void mouseEvent( MouseEvent event ) {
  
}

void draw() {
  background( #00ff00 );
}

