
class MainCSV {
  
  MainCSVLine[] lines = new MainCSVLine[1];
  int totalLines = 0;
  
  MainCSV(){}
  
  void addLine( MainCSVLine line ) {
    if ( totalLines >= lines.length ) {
       lines = ( MainCSVLine[] ) expand( lines, lines.length + 1 );
    }
    lines[ totalLines ] = line;
    totalLines++;
  }
  
  void write( String path ) {
    PrintWriter pw = createWriter( path );
    pw.println( "NodeTitle,SizeValue,ExpandCSV,DataCSV,FullDataCSV,ModifiersCSV,DataQuery,NodeColor,ShowValue" );
    
    for( int i = 0; i < totalLines; i++ ) {
      String s = "";
      if ( lines[i].NodeTitle != null ) s += lines[i].NodeTitle+",";
      else s += ",";
      
      if ( !Float.isNaN( lines[i].SizeValue ) ) s += lines[i].SizeValue+",";
      else s += ",";
      
      if ( lines[i].ExpandCSV != null ) s += lines[i].ExpandCSV+",";
      else s += ",";
      
      if ( lines[i].DataCSV != null ) s += lines[i].DataCSV+",";
      else s += ",";
      
      if ( lines[i].FullDataCSV != null ) s += lines[i].FullDataCSV+",";
      else s += ",";
      
      if ( lines[i].ModifiersCSV != null ) s += lines[i].ModifiersCSV+",";
      else s += ",";
      
      if ( lines[i].DataQuery != null ) s += lines[i].DataQuery+",";
      else s += ",";
      
      if ( lines[i].NodeColor != null ) s += lines[i].NodeColor+",";
      else s += ",";
      
      s += lines[i].ShowValue;
      
      pw.println( s );
    }
    
    pw.flush();
    pw.close();
  }
  
}

class MainCSVLine {
  String NodeTitle;
   float SizeValue = 75;
   String ExpandCSV;
   String DataCSV;
   String FullDataCSV;
   String ModifiersCSV;
   String DataQuery;
   String NodeColor;
   int ShowValue = 0;
   
   MainCSVLine(){}
   
   void setNodeTitle( String s ) {
      NodeTitle = s;
   }
   
   void setSizeValue( float i ) {
      SizeValue = i;
   }
   
   void setExpandCSV( String s ) {
     ExpandCSV = s; 
   }
   
   void setDataCSV( String s ) {
     DataCSV = s; 
   }
   
   void seFullDataCSV( String s ) {
     FullDataCSV = s; 
   }
   
   void setModifiersCSV( String s ) {
     ModifiersCSV = s; 
   }
   
   void setDataQuery( String s ) {
     DataQuery = s; 
   }
   
   void setNodeColor( String s ) {
     NodeColor = s; 
   }
   
   void setShowValue( int i ) {
      ShowValue = i;
   }
}
