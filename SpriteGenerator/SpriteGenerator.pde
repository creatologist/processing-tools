//------------------------------------------------- IMPORTS

import processing.core.*;
import processing.opengl.*;


//------------------------------------------------- VARIABLES - CORE


//------------------------------------------------- VARIABLES


//------------------------------------------------- SETUP

void setup() {
  size( 800, 400 );
  outputPNG = createGraphics( width, height, JAVA2D ); 
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

PGraphics outputPNG;

//------------------------------------------------- DRAW
void pre() {
  File dir = new File(dataPath(""));
  String[] list = dir.list();
  
  if ( list != null ) {
    println( list );
    
    File checkDir;
    for ( int i = 0, len = list.length; i < len; i++ ) {
      checkDir = new File( dataPath( list[i] ) );
      println( i + " -- " +  checkDir.isDirectory() );
    }
  }
  
  
}

ImageSequence[] imageSequences;
boolean savePNG = false;
PImage img;

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
    
    for ( int i = 0, len = list.length; i < len; i++ ) {
      checkDir = new File( dataPath( list[i] ) );
      
      
      //println( i + " -- " +  checkDir.isDirectory() );
      if ( checkDir.isDirectory() ) {
        println( "---------- " + i + ": " + list[i] + " (folder) ----------" );
        imageSequences[imageSequenceCount] = new ImageSequence( checkDir.list(), list[i], true );
        imageSequenceCount++;
      } else {
        println( "---------- " + i + ": " + list[i] + " ----------" );
        rootImageList[rootImageCount] = list[i];
        rootImageCount++;
      }
    }
    
    
    println( "" );
    println( "" );
    println( "---------- root images ----------" );
    imageSequences[imageSequenceCount] = new ImageSequence( rootImageList, "root" );
    
    outputPNG = createGraphics( 800, height, JAVA2D );
    
    img = loadImage( list[1] );
    img.loadPixels();
    
    //int middleX = Math.round(image.width * .5);
    minX = img.width;
    maxX = 0;
    
    //int middleY = Math.round(image.height * .5);
    minY = img.height;
    maxY = 0;
    
    //for ( int y = 0, max_y = image.height; y < max_y; y++ ) {
      for ( int y = 0, max_y = img.height; y < max_y; y++ ) {
      for ( int x = 0, max_x = img.width; x < max_x; x++ ) {
          if ( img.pixels[ ( y * img.width ) + x ] != 0 ) {
            if ( x < minX ) minX = x;
            if ( x > maxX ) maxX = x;
            if ( y < minY ) minY = y;
            if ( y > maxY ) maxY = y;
          }
          /*print(  );
          //println( image.pixels[ ( y * image.width ) + x ] );
          if ( x < middleX ) {
            
          } else {
            
          }*/
      }
    }
    
    
    println( "minX: " + minX );
    println( "maxX: " + maxX );
    println( "minY: " + minY );
    println( "maxY: " + maxY );
    
    img_width = maxX - minX;
    img_height = maxY - minY;
    
    println( img_width + ", " + img_height ); 
    
    
    savePNG = true;
    
  }
  
  
}

int minX;
int maxX;
int minY;
int maxY;
int img_width;
int img_height;

public void mouseEvent( MouseEvent event ) {
  
}

void draw() {
  //background( #00ff00 );
  if ( savePNG ) {
    clear();
    outputPNG.clear();
    outputPNG.beginDraw();
    //outputPNG.fill( 255, 100 );
    outputPNG.rect( random( width ), random( height ), 30, 30 );
    println( minX );
    println( minY );
    println( img_width );
    println ( img_height );
    //outputPNG.image( img, 0, 0, img_width, img_height, minX, minY, img_width, img_height );
    outputPNG.image( img.get( minX, minY, img_width, img_height), 0, 0 );
    outputPNG.endDraw();
    
    image( outputPNG, 0, 0 );
    //image( img, -minX, -minY, img.width, img.height, minX, minY, img_width, img_height );
    //image( img, 0, 0, img_width, img_height, -minX, -minY, img_width, img_height );
    
    //image( img, -minX, -minY, img.width, img.height, minX, minY );
    
    outputPNG.save( "output/spritesheet.png" );
    
    savePNG = false;
  }
  
}

