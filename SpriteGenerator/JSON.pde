class JSON {
  String data;
  
  JSON() {}
  
  void parseImageSequenceFrames( ImageSequence imgsq_ ) {
    data = "{";
    data += "\"" + imgsq_.name + "\":{";
    
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
      
      data += "\"width\":";
      data += imgsq_.imageData[i].width;
      data += ",";
      
      data += "\"height\":";
      data += imgsq_.imageData[i].height;
      
      data += "}";
      
      if ( i < len - 1 ) data += ",";
      
    }
    
    data += "}}";
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
      
      data += "\"width\":";
      data += imgsq_.imageData[i].width;
      data += ",";
      
      data += "\"height\":";
      data += imgsq_.imageData[i].height;
      
      data += "}";
      
      if ( i < len - 1 ) data += ",";
      
    }
    
    data += "]}";
    
  }

  
  JSON parse( ImageSequence imgsq_ ) {
    
    //ImageData[] imageData;
    
    if ( imgsq_.folder == true ) {
      if ( imgsq_.type == "animation" ) parseImageSequenceAnimation( imgsq_ );
      else parseImageSequenceFrames( imgsq_ );
    }
    
    
    
    return this;
  };
  
  void write( String path_ ) {
    
    PrintWriter pw = createWriter( path_ );
    pw.println( data );
    
    pw.flush();
    pw.close();
  }
  
}
