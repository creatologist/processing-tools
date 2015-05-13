
class ModCSV {
  
  ModCSVLine[] lines = new ModCSVLine[1];
  int totalLines = 0;
  
  ModCSV(){}
  
  void addLine( ModCSVLine line ) {
    if ( totalLines >= lines.length ) {
       lines = ( ModCSVLine[] ) expand( lines, lines.length + 1 );
    }
    lines[ totalLines ] = line;
    totalLines++;
  }
  
  void write( String path ) {
    PrintWriter pw = createWriter( path );
    
    pw.println( "Type,Name,Values,Min,Max,Increment,ImgPath" );
    
    for( int i = 0; i < totalLines; i++ ) {
      String s = "";
      
      if ( lines[i].Type != null ) s += lines[i].Type+",";
      else s += ",";
      
      if ( lines[i].Name != null ) s += lines[i].Name+",";
      else s += ",";
      
      if ( lines[i].Values != null ) s += lines[i].Values+",";
      else s += ",";
      
      if ( !Float.isNaN( lines[i].Min ) ) s += lines[i].Min+",";
      else s += ",";
      
      if ( !Float.isNaN( lines[i].Max ) ) s += lines[i].Max+",";
      else s += ",";
      
      if ( !Float.isNaN( lines[i].Increment ) ) s += lines[i].Increment+",";
      else s += ",";
      
      if ( lines[i].ImgPath != null ) s += lines[i].ImgPath+",";
      else s += ",";
      
      pw.println( s );
    }
    
    pw.flush();
    pw.close();
  }
  
}

class ModCSVLine {
   
   String Type;
   String Name;
   
   String Values;
   int Min;
   int Max;
   int Increment;
   
   String ImgPath;
   
   ModCSVLine( String type, String name ){
     Type = type;
     Name = name;
   }
   
   void setValues( String s ) {
     Values = s; 
   }
   
   void setMinMax( int min, int max ) {
     Min = min;
     Max = max; 
   }
   
   void setMin( int i ) {
     Min = i; 
   }
   
   void setMax( int i ) {
     Max = i; 
   }
   
   void setIncrement( int i ) {
     Increment = i;
   }
   
   void setImgPath( String s ) {
     ImgPath = s;
   }
}
