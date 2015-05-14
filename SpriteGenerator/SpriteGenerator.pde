//------------------------------------------------- IMPORTS

import processing.core.*;
import processing.opengl.*;


//------------------------------------------------- VARIABLES - CORE


//------------------------------------------------- VARIABLES


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
    
  }
  
  
}

public void mouseEvent( MouseEvent event ) {
  
}

void draw() {
  background( #00ff00 );
}

