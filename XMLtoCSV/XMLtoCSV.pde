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

Categories categories;



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// SETUP

XML xml;

void setup() {
  xml = loadXML( "sprint_reviews.xml" );
  categories = new Categories();
  
  csvCore();
  //csvBrands();
  csvProducts();
  //csvBrands();
  //csvCategories();
  
  println( "" );
  println( "DONE!" );
  
  
  /*PrintWriter output = createWriter( "output/core.csv" );
  output.println( "id, disabled, brand" );
  for ( int i = 0; i < children.length; i++ ) {
    int id = children[i].getInt( "id" );
    String disabled = children[i].getString( "disabled" );
    //XML[] source = children[i].getChildren( "Source" )[0].getStringContent();
    //String source = children[i].getChildren( "Source" )[0].getContent();
    String brand = children[i].getChildren( "Brand" )[0].getContent();
    output.println( id + ", " + disabled + ", " + brand );
    println( id + ", " + disabled + ", " + brand );
  }
  
  
  //output.println( "hi,hi,hi");
  //output.println( "there,there,there" );
  output.flush();
  output.close();*/
}

void csvCore() {
  MainCSV mCSV = new MainCSV();
  MainCSVLine line = new MainCSVLine();
  line.setNodeTitle( "Sprint" );
  line.setSizeValue( 300 );
  line.setExpandCSV( "sprint.csv" );
  line.setNodeColor( "00ff00" );
  mCSV.addLine( line );
  
  mCSV.write( "output/core.csv" );
}

void csvProducts() {
  //MainCSV mCSV = new MainCSV();
  /*MainCSVLine line = new MainCSVLine();
  line.setNodeTitle( "Products" );
  line.setSizeValue( 100 );
  line.setExpandCSV( "products.csv" );
  line.setNodeColor( "00ff00" );
  mCSV.addLine( line );*/
  
  //mCSV.write( "output/sprint.csv" );
  
  
  
  MainCSV products = new MainCSV();
  XML[] children = xml.getChildren( "Product" );
  
  /*ModCSV pieMod = new ModCSV();
  ModCSVLine pieLine = new ModCSVLine( "Visualization", "Pie" );
  
  pieMod.addLine( pieLine );
  pieMod.write( "output/pie.mod.csv" );*/
  
  for ( int i = 0; i < children.length; i++ ) {
    /*MainCSVLine l = new MainCSVLine();
    l.setNodeTitle( removeCommas( children[i].getChildren( "Name" )[0].getContent(), "" ) );
    products.addLine( l );*/
    
    //ModCSV mod = new ModCSV( "Visual    
    
    
    
    XML[] categoryItems = children[i].getChildren( "CategoryItems" )[0].getChildren( "CategoryItem" );
    for ( int j = 0, jMax = categoryItems.length; j < jMax; j++ ) {      
      //String categoryID = categoryItems[j].getChild( "CategoryId" ).getContent();
      int categoryID = categoryItems[j].getInt( "id" );
      if ( categoryID == 1000 ) continue;
      //println( categoryID );
      
      // CATEGORY NAME
      String cName = categoryItems[j].getChild( "CategoryName" ).getContent();
      if ( cName.equals( "Datacards, tablets & more" ) ) cName = "Datacards/Tablets/Other";
      else if ( cName.equals( "Feature phones" ) ) cName = "Feature Phones";
      
      int arrayPos = categories.hasCategoryID( categoryID );
      if ( arrayPos == -1 ) {
        Category c = new Category( categoryID, cName );
        categories.push( c );
        categories.all[ categories.total - 1 ].addProduct( new Product( children[ i ] ) );
      } else {
        
        categories.all[ arrayPos ].addProduct( new Product( children[ i ] ) );
       
        
      }
      
      //int arrayPos = categories.hasCategoryID( categoryItems[j]
      
      //categories.push( cName );
    }
    
  }
  
  for ( int i = 0, iLen = categories.total; i < iLen; i++ ) {
    MainCSVLine l = new MainCSVLine();
    l.setNodeTitle( categories.all[i].name );
    l.setSizeValue( categories.all[i].total * 10 );
    l.setExpandCSV( "cat-" + i + ".csv" );
    products.addLine( l );
  }
  
  products.write( "output/sprint.csv" );
  //println( categories.all );
  
  
  
  
  for ( int i = 0, iLen = categories.total; i < iLen; i++ ) {
    //println( categories.all[i].name );
    
    println( "" );
    println( "" );
    println( "================================================================================= " + categories.all[i].name );
    
    MainCSV csv = new MainCSV();
    
    
    if ( categories.all[i].total < 12 ) {
       for ( int j = 0, jLen = categories.all[i].total; j < jLen; j++ ) {
        println( categories.all[i].all[j].Name );
        //if ( brands.find( categories.all[i].all[j].Brand ) == -1 ) b.push( categories.all[i].all[j].Brand );
        
        DataCSV data = new DataCSV();
        DataCSVLine line1 = new DataCSVLine();
        line1.Pie = "1 Star";
        line1.SizeValue = categories.all[i].all[j].RatingValue1;
        DataCSVLine line2 = new DataCSVLine();
        line2.Pie = "2 Stars";
        line2.SizeValue = categories.all[i].all[j].RatingValue2;
        DataCSVLine line3 = new DataCSVLine();
        line3.Pie = "3 Stars";
        line3.SizeValue = categories.all[i].all[j].RatingValue3;
        DataCSVLine line4 = new DataCSVLine();
        line4.Pie = "4 Stars";
        line4.SizeValue = categories.all[i].all[j].RatingValue4;
        DataCSVLine line5 = new DataCSVLine();
        line5.Pie = "5 Stars";
        line5.SizeValue = categories.all[i].all[j].RatingValue5;
        data.addLine( line1 );
        data.addLine( line2 );
        data.addLine( line3 );
        data.addLine( line4 );
        data.addLine( line5 );
        data.write( "output/prod-" + categories.all[i].all[j].ID + ".data.csv" );
        
        MainCSVLine l = new MainCSVLine();
        l.setNodeTitle( categories.all[i].all[j].Name );
        l.setDataCSV( "prod-" + categories.all[i].all[j].ID + ".data.csv" );
        l.setSizeValue( categories.all[i].all[j].AverageOverallRating );
        l.setModifiersCSV( "pie.mod.csv" );
        csv.addLine( l );
      }
      
      csv.write( "output/cat-" + i + ".csv" );
       continue; 
    }
    
    
    Brands b = new Brands();
    
    for ( int j = 0, jLen = categories.all[i].total; j < jLen; j++ ) {
      println( categories.all[i].all[j].Name );
      int arrayPos = b.find( categories.all[i].all[j].Brand );
      if ( arrayPos == -1 ) b.push( new Brand( categories.all[i].all[j].Brand ) );
      else b.all[ arrayPos ].count++;
    }
   
   for ( int k = 0, kLen = b.total; k < kLen; k++ ) {
     
     MainCSVLine l = new MainCSVLine();
     l.setNodeTitle( b.all[k].name );
     l.setSizeValue( b.all[k].count );
     l.setExpandCSV( "cat-" + i + ".brand-" + k + ".csv" );
     csv.addLine( l );
     
     MainCSV csv2 = new MainCSV();
     
     for ( int j = 0, jLen = categories.all[i].total; j < jLen; j++ ) {
      //if ( b.find( categories.all[i].all[j].Brand ) == -1 ) b.push( categories.all[i].all[j].Brand );
      //println( b.all[k] + " -- " + categories.all[i].all[j].Brand );
      if ( b.all[k].name.equals( categories.all[i].all[j].Brand ) ) {
        //println( b.all[k] + " -- " + categories.all[i].all[j].Brand );
        ModCSV pieMod = new ModCSV();
        ModCSVLine pieLine = new ModCSVLine( "Visualization", "Pie" );
        pieLine.setImgPath( categories.all[i].all[j].ImageUrl );
        pieMod.addLine( pieLine );
        pieMod.write( "output/prod-" + categories.all[i].all[j].ID + ".mod.csv" );
        
        DataCSV data = new DataCSV();
        DataCSVLine line1 = new DataCSVLine();
        line1.Pie = "1 Star";
        line1.SizeValue = categories.all[i].all[j].RatingValue1;
        DataCSVLine line2 = new DataCSVLine();
        line2.Pie = "2 Stars";
        line2.SizeValue = categories.all[i].all[j].RatingValue2;
        DataCSVLine line3 = new DataCSVLine();
        line3.Pie = "3 Stars";
        line3.SizeValue = categories.all[i].all[j].RatingValue3;
        DataCSVLine line4 = new DataCSVLine();
        line4.Pie = "4 Stars";
        line4.SizeValue = categories.all[i].all[j].RatingValue4;
        DataCSVLine line5 = new DataCSVLine();
        line5.Pie = "5 Stars";
        line5.SizeValue = categories.all[i].all[j].RatingValue5;
        data.addLine( line1 );
        data.addLine( line2 );
        data.addLine( line3 );
        data.addLine( line4 );
        data.addLine( line5 );
        data.write( "output/prod-" + categories.all[i].all[j].ID + ".data.csv" );
        
        MainCSVLine l2 = new MainCSVLine();
        l2.setNodeTitle( categories.all[i].all[j].Name );
        l2.setDataCSV( "prod-" + categories.all[i].all[j].ID + ".data.csv" );
        //l.setModifiersCSV( "prod-" + categories.all[i].all[j].ID + ".mod.csv" );
        l2.setSizeValue( categories.all[i].all[j].AverageOverallRating );
        //l2.setModifiersCSV( "pie.mod.csv" );
        
        l2.setModifiersCSV( "prod-" + categories.all[i].all[j].ID + ".mod.csv" );
        csv2.addLine( l2 );
      }
    }
     csv2.write( "output/cat-" + i + ".brand-" + k + ".csv" );
   }
   
   csv.write( "output/cat-" + i + ".csv" );
   
     
  }
  
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

