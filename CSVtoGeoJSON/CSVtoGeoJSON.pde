//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// IMPORTS

import processing.core.*;
import processing.opengl.*;
import codeanticode.glgraphics.*;
import javax.media.opengl.GL2;
import java.awt.*;
import java.awt.event.MouseWheelEvent;
import java.awt.event.MouseWheelListener;
import java.awt.geom.*;
import java.util.HashMap;

import toxi.geom.*;

import java.awt.Desktop;
import java.io.IOException;
import java.net.URI;

//import controlP5.*;


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// VARIABLES - CORE
int WIDTH = 1000;
int HEIGHT = 700;
int HALF_WIDTH;
int HALF_HEIGHT;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// VARIABLES


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// SETUP

XML xml;

CSV csv;
GeoJSON geoJSON;

void setup() {
  csv = new CSV( "nielsen-dma.csv", true );
  
  println( csv.titles );
  
  
  geoJSON = new GeoJSON();
  geoJSON.parseCSV( csv );
  geoJSON.write( "output/test.json" );
  
  println( "" );
  println( "DONE!" );
}


String removeCommas( String s, String s2  ) {
   if ( s.indexOf( ',' ) == -1 ) return s;
   else {
      s = s.replace( ",", s2 );
      //println( s );
      return s;
   }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// BACKGROUND


void mousePressed() {
}

void mouseReleased() {
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// KEY PRESSED


void keyPressed() {
  if ( key == CODED ) {
    //console.log( "Keyboard CODED: " + keyCode );
    if ( keyCode == UP ) {
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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// DRAW
void pre() {
}

public void mouseEvent( MouseEvent event ) {
}

void draw() {
  background( #00ff00 );
}

