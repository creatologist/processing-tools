class ImageData {
  public int x = 0;
  public int y = 0;
  public int originalX = 0;
  public int originalY = 0;
  public int width = 0;
  public int height = 0;
  public String name = "";
  
  ImageData(){};
  ImageData( int x_, int y_, int originalX_, int originalY_, int width_, int height_ ){
    _init( x_, y_, originalX_, originalY_, width_, height_, name );
  };
  
  ImageData( int x_, int y_, int originalX_, int originalY_, int width_, int height_, String name_ ){
    _init( x_, y_, originalX_, originalY_, width_, height_, name_ );
  };
  
  void _init( int x_, int y_, int originalX_, int originalY_, int width_, int height_, String name_ ) {
    this.x = x_;
    this.y = y_;
    this.originalX = originalX_;
    this.originalY = originalY_;
    this.width = width_;
    this.height = height_;
    this.name = name_;
  };
    
    
    
}

public class ImageSequence {
  
  String [] imagePaths;
  int totalImages;
  String name;
  boolean folder = false;
  PImage[] images;
  String type = "frames";
  
  int maxWidth = 5000;
  
  int imagesPerRow;
  int totalRows;
  
  PGraphics outputPNG;
  ImageData[] imageData;
  
  JSON json;
  
  // constructors
  ImageSequence( String[] imagePaths_, String name_ ) {
    _init( imagePaths_, name_, false );
  }
  
  ImageSequence( String[] imagePaths_, String name_, boolean folder_ ) {
    _init( imagePaths_, name_, folder_ );  
  }
  
  void _init( String[] imagePaths_, String name_, boolean folder_ ) {
    json = new JSON();
    
    name = name_;
    if ( name.indexOf( "--animation" ) != -1 ) {
      type = "animation";
      name = name.substring( 0, name.indexOf( "--animation" ) );
    }
    imagePaths = imagePaths_;
    folder = folder_;
    totalImages = imagePaths_.length;
    
    println( "new ImageSequence (" + name_ + ") total images:" + imagePaths.length  );
    //println( imagePaths );
    //println( "" );
    
    images = new PImage[ imagePaths.length ];
    imageData = new ImageData[ imagePaths.length ];
    
    int pixel_x_min, pixel_x_max;
    int pixel_y_min, pixel_y_max;
    int w, h;
    
    int total_width = 0,
      total_height = 0;
    
    for ( int i = 0, len = imagePaths.length; i < len; i++ ) {
      if ( folder ) {
        if ( type == "frames" ) images[i] = loadImage( dataPath( name + "/" + imagePaths[i] ) );
        else images[i] = loadImage( dataPath( name + "--animation/" + imagePaths[i] ) );
      } else {
        images[i] = loadImage( dataPath( imagePaths[i] ) );
      }
      
      pixel_x_min = images[i].width;
      pixel_x_max = 0;
      
      pixel_y_min = images[i].height;
      pixel_y_max = 0;
      
      //images[i] = images[i].get( 0, 0, 300, 300 );
      images[i].loadPixels();
      
      for ( int y = 0, max_y = images[i].height; y < max_y; y++ ) {
        for ( int x = 0, max_x = images[i].width; x < max_x; x++ ) {
          // find used pixels
          if ( images[i].pixels[ ( y * images[i].width ) + x ] != 0 ) {
            if ( x < pixel_x_min ) pixel_x_min = x;
            if ( x > pixel_x_max ) pixel_x_max = x;
            if ( y < pixel_y_min ) pixel_y_min = y;
            if ( y > pixel_y_max ) pixel_y_max = y;
          }
        }
      }
      
      w = pixel_x_max - pixel_x_min;
      h = pixel_y_max - pixel_y_min;
      images[i] = images[i].get( pixel_x_min, pixel_y_min, w, h );
      imageData[i] = new ImageData();
      imageData[i].originalX = pixel_x_min;
      imageData[i].originalY = pixel_y_min;
      imageData[i].width = w;
      imageData[i].height = h;
      
      total_width += w;
      total_height += h;
      
      println( "[" + i + "] " + imagePaths[i] + " -- " + images[i].width + "x" + images[i].height ); 
    }
    println( "" );
    println( "" );
    
    float avg_width = total_width / totalImages;
    float avg_height = total_height / totalImages;
    
    int images_per_row = (int)Math.ceil( sqrt( imagePaths.length ) );
    
    while ( images_per_row * avg_width > maxWidth ) {
      images_per_row--;
    }
    
    int output_width = 0;
    
    /*for ( int i = 0; i < images_per_row; i++ ) {
      ouput_width += 
    }*/
    
    
    int rows = (int)Math.ceil(totalImages / images_per_row);
    
    int max_width = 0;
    int max_height = 0;
    
    int row_width = 0;
    int row_count = 0;
    
    while ( row_count < rows ) {
      row_width = 0;
       for ( int i = 0; i < images_per_row; i++ ) {
         row_width += images[ (images_per_row*row_count) + i ].width;
       }
       if ( row_width > max_width ) max_width = row_width;
      row_count++;
    }

    int columns = images_per_row;
    int column_count = 0;
    
    int column_height = 0;
    int index;
    
    //int images_per_column = (int)Math.floor( totalImages / rows );
    
    //int images_per_column = totalImages / images_per_row
    
    //println( "images_per_column: " + rows );
    
    while ( column_count < columns ) {
      column_height = 0;
      
      for ( int i = 0, len = rows; i < len; i++ ) {
        index = column_count + (i*images_per_row);
        if ( index < totalImages ) column_height += images[ index ].height;
        
      }
      if ( column_height > max_height ) max_height = column_height;
      //println( column_count );
      //println( columns );
      column_count++;
    }
    
    
    imagesPerRow = images_per_row;
    totalRows = rows;
    
    row_count = 0;
    int x = 0,
        y = 0;
    int max_w, max_h;
    while ( row_count < totalRows + 1 ) {
      x = 0;
      max_h = 0;
      for ( int i = 0; i < imagesPerRow; i++ ) {
        index = (row_count*imagesPerRow)+i;
        if ( index < totalImages ) {
          x += images[index].width;
          if ( images[index].height > max_h ) max_h = images[index].height;
        }
        
      }
      y += max_h;
      row_count++;
    }
    
    
    max_height = y;
    
    outputPNG = createGraphics( max_width, max_height, JAVA2D );
    
    savePNG( "output/spritesheets/" + name + ".png" );
    //saveJSON( "output/json/" + name + ".json" );
    
    //println( "this" );
    //println( this );
    
    
    
  };
  
  void createJSON() {
    //this.type = type_;
    json.write( "output/json/" + this.name + ".json" );
    json.parse( this ).write( "output/json/" + name + ".json" );
  };
  
  
  
  ImageSequence get() {
    return this;
  };
  
  //
  
  void savePNG( String filePath_ ) {
    outputPNG.clear();
    outputPNG.beginDraw();
    
    int row_count = 0;
    int x = 0,
        y = 0;
    int max_w, max_h;
    int index;
    String new_name;
    while ( row_count < totalRows + 1 ) {
      x = 0;
      max_h = 0;
      for ( int i = 0; i < imagesPerRow; i++ ) {
        index = (row_count*imagesPerRow)+i;
        if ( index < totalImages ) {
          //println( index );
          new_name = imagePaths[ index ];
          new_name = new_name.substring( 0, new_name.indexOf( "." ) );
          //imageData[index] = new ImageData( x, y, images[index].width, images[index].height, new_name );
          imageData[index].name = new_name;
          imageData[index].x = x;
          imageData[index].y = y;
          outputPNG.image( images[index], x, y );
          x += images[index].width;
          if ( images[index].height > max_h ) max_h = images[index].height;
        }
        
      }
      y += max_h;
      row_count++;
    }
    
    outputPNG.endDraw();
    outputPNG.save( filePath_ );
  }
  
  
}
