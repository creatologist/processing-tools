class JSON {
  String data = "{}";
  
  JSON() {}
  
  void parseImageSequenceFrames( ImageSequence imgsq_ ) {
    data = "{";
    if ( imgsq_.name != "root" ) data += "\"" + imgsq_.name + "\":{";
    
    //println( data );
    //println( imgsq_.imageData );
    
    //ImageData imgData;
    
    for ( int i = 0, len = imgsq_.imageData.length; i < len; i++ ) {
      //imgData = imgsq_.imageData[i];
      //println( imgsq_.imageData[i] );
      //println( "[" + i + "] " + imgsq_.imageData[i] );
      data += "\"" + imgsq_.imageData[i].name + "\":";
      data += "{";
      
      data += "\"x\":";
      data += imgsq_.imageData[i].x;
      data += ",";
      
      data += "\"y\":";
      data += imgsq_.imageData[i].y;
      data += ",";
      
      data += "\"offsetX\":";
      data += imgsq_.imageData[i].originalX;
      data += ",";
      
      data += "\"offsetY\":";
      data += imgsq_.imageData[i].originalY;
      data += ",";
      
      data += "\"width\":";
      data += imgsq_.imageData[i].width;
      data += ",";
      
      data += "\"height\":";
      data += imgsq_.imageData[i].height;
      
      data += "}";
      
      if ( i < len - 1 ) data += ",";
      
    }
    
    data += "}";
    if ( imgsq_.name != "root" ) data += "}";
    
    //println( data );
  };
  
  void parseImageSequenceAnimation( ImageSequence imgsq_ ) {
    data = "{";
    data += "\"" + imgsq_.name + "\":[";
    
    //ImageData imgData;
    
    for ( int i = 0, len = imgsq_.imageData.length; i < len; i++ ) {
      //imgData = imgsq_.imageData[i];
      //println( imgsq_.imageData[i] );
      //println( "[" + i + "] " + imgsq_.imageData[i] );
      
      data += "{";
      
      data += "\"x\":";
      data += imgsq_.imageData[i].x;
      data += ",";
      
      data += "\"y\":";
      data += imgsq_.imageData[i].y;
      data += ",";
      
      data += "\"offsetX\":";
      data += imgsq_.imageData[i].originalX;
      data += ",";
      
      data += "\"offsetY\":";
      data += imgsq_.imageData[i].originalY;
      data += ",";
      
      data += "\"width\":";
      data += imgsq_.imageData[i].width;
      data += ",";
      
      data += "\"height\":";
      data += imgsq_.imageData[i].height;
      
      data += "}";
      
      if ( i < len - 1 ) data += ",";
      
    }
    
    data += "]}";
    
  };
  
  int jsonCount = 0;
  
  JSON empty() {
    data = "{}";
    jsonCount = 0;
    return this;
  };
  
  JSON combine( JSON json_ ) {
    
    if ( jsonCount == 0 ) {
      data = "{";
      data += json_.data.substring( 1, json_.data.length() - 1 );
    } else {
      data = data.substring( 0, data.length() - 1 );
      data += ",";
      data += json_.data.substring( 1, json_.data.length() - 1 );
    }
    
    data += "}";
    jsonCount++;
    return this;
  };

  
  JSON parse( ImageSequence imgsq_ ) {
    
    //ImageData[] imageData;
    
    data = "";
    
    if ( imgsq_.type == "animation" ) parseImageSequenceAnimation( imgsq_ );
    else parseImageSequenceFrames( imgsq_ );
    
    
    
    return this;
  };
  
  void write( String path_ ) {
    
    PrintWriter pw = createWriter( path_ );
    pw.println( data );
    
    pw.flush();
    pw.close();
  }
  
}
