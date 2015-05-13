
class DataCSV {
  
  DataCSVLine[] lines = new DataCSVLine[1];
  int totalLines = 0;
  
  DataCSV(){}
  
  void addLine( DataCSVLine line ) {
    if ( totalLines >= lines.length ) {
       lines = ( DataCSVLine[] ) expand( lines, lines.length + 1 );
    }
    lines[ totalLines ] = line;
    totalLines++;
  }
  
  void write( String path ) {
    PrintWriter pw = createWriter( path );
    
    pw.println( "Pie,Year,Category,SizeValue,ExpandCSV,DataCSV,FullDataCSV,ModifiersCSV,DataQuery" );
    
    for( int i = 0; i < totalLines; i++ ) {
      String s = "";
      if ( lines[i].Pie != null ) s += lines[i].Pie+",";
      else s += ",";
      
      if ( !Float.isNaN( lines[i].Year ) ) s += lines[i].Year+",";
      else s += ",";
      
      if ( lines[i].Category != null ) s += lines[i].Category+",";
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
      
      pw.println( s );
    }
    
    pw.flush();
    pw.close();
  }
  
}

class DataCSVLine {
   
   String Pie;
   int Year;
   String Category;
   
   int SizeValue;
   String ExpandCSV;
   String DataCSV;
   String FullDataCSV;
   String ModifiersCSV;
   String DataQuery;
   
   DataCSVLine(){}
   
   void setPie( String s ) {
      Pie = s;
   }
   
   void setYear( int i ) {
      Year = i;
   }
   
   void setCategory( String s ) {
     Category = s; 
   }
   
   void setSizeValue( int i ) {
     SizeValue = i; 
   }
   
   void setExpandCSV( String s ) {
     ExpandCSV = s; 
   }
   
   void setDataCSV( String s ) {
     DataCSV = s; 
   }
   
   void setFullDataCSV( String s ) {
     FullDataCSV = s; 
   }
   
   void setModifiersCSV( String s ) {
     ModifiersCSV = s; 
   }
   
   void setDataQuery( String s ) {
     DataQuery = s; 
   }
}
