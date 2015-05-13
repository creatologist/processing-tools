
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// DATA

class CSS {
   
  String [] lines;
  int totalLines;
  
  String data;
  
  String retinaPath;
  int retinaWidth;
  int retinaHeight;
  
  CSS() {}

  CSS( String path ) {
    lines = loadStrings( path );
    totalLines = lines.length;
    
    //println( lines[ 0 ] );
  
  }
  
  void retina( String path, int width, int height ) {
      retinaPath = path;
      retinaWidth = width;
      retinaHeight = height;
  };
  
  void createRetina() {
    data = "";
    String line;
    String tabs;
    String [] valuesA;
    String [] valuesB;
     for ( int i = 0; i < totalLines; i++ ) {
       if ( lines[i].indexOf( ":" ) == -1 ) {
         data += lines[ i ];
         data += "\n";
       } else {
         if ( lines[ i ].indexOf( "background-position" ) != -1 ) {
            valuesA = lines[ i ].split( "px" );
            if ( valuesA.length > 2 ) {
              tabs = valuesA[ 0 ].split( "b" )[0];
              
               data += tabs + "background-image: url('" + retinaPath + "');\n";
               data += tabs + "background-size: " + retinaWidth + "px " + retinaHeight + "px;\n"; 
            }
         }
         
         /*if ( lines[ i ].indexOf( "background-position" ) != -1 ) {
           
           valuesA = lines[ i ].split( "px" );
           
           if ( valuesA.length > 2 ) {
             
             
               valuesB = valuesA[ 0 ].split( ":" );
               line = valuesB[ 0 ] + ": ";
             //println( valuesA );
             //println( valuesB );
             line += parseFloat( valuesB[ 1 ] ) * 2;
             line += "px ";
             
             //println( valuesA );
             
             line += parseFloat( valuesA[ 1 ] ) * 2;
             line += "px";
             
             line += ";\n";
             
              data += line;
           }
           
         }*/
       }
     }
  };
  
  void writeRetina( String path ) {
     createRetina();
    
    PrintWriter pw = createWriter( path );
    pw.println( data );
    
    pw.flush();
    pw.close();
  }
}
