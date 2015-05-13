
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// DATA

class CSV {
  
  String [] lines;
  String [][] data;
  String [] convertedDates;
  int columns;
  int rows;
  String [] titles;
  
  CSV() {}
  
  CSV( String path ) {
    _init( path, false );
  }
  
  CSV( String path, Boolean firstRowTitles ) {
    _init( path, firstRowTitles );
  }
  
  void destroy() {
    /*String [] lines = new String[0];
    String [][] data = new String[0][0];
    String [] convertedDates = new String[0];
    String [] titles = new String[0];*/
    String [] lines = null;
    String [][] data = null;
    String [] convertedDates;
    String [] titles;
  }
  
  private void _init ( String path, Boolean firstRowTitles ) {
    lines = loadStrings( path );
    
    //calculate max width of CSV file
    for (int i=0; i < lines.length; i++) {
      String [] chars=split(lines[i],',');
      if (chars.length>columns){
        columns=chars.length;
      }
    }
    
    String [] temp;
    
    if ( firstRowTitles ) {
      data = new String [lines.length - 1][columns];
      convertedDates = new String [lines.length - 1];
      
      titles = split(lines[0], ',');
      //parse values into 2d array
      for (int i=1; i < lines.length; i++) {
        temp = new String [lines.length];
        temp= split(lines[i], ',');
        for (int j=0; j < temp.length; j++){
          data[i - 1][j]=temp[j];
        }
      }
    } else {
      data = new String [lines.length][columns];
      //parse values into 2d array
      for (int i=0; i < lines.length; i++) {
        temp = new String [lines.length];
        temp= split(lines[i], ',');
        for (int j=0; j < temp.length; j++){
          data[i][j]=temp[j];
        }
      }
    }
    
    rows = data.length;
    
  }
  
  String[][] data() {
    return data;
  }
  
  CSV convertDate( int type, int newType ) {
    if ( titles.length == 0 ) return this;
    int _column = _.find( "date", titles );
    if ( _column == -1 ) return this;
    String separator = "";
    if ( data[_column][0].indexOf( "-" ) != -1 ) separator = "-";
    else if ( data[_column][0].indexOf( "/" ) != -1 ) separator = "/";
    return convertDate( type, newType, separator );
  }
  
  CSV convertDate( int type, int newType, String separator ) {
    if ( titles.length == 0 ) return this;
    
    int _column = _.find( "date", titles );
    
    if ( _column != -1 ) {
      String newDate;
       for ( int i = 0; i < rows; i++ ) {
         newDate = Date.convert( data[i][_column], type, newType, separator );
         if ( newDate != "" ) convertedDates[i] = newDate; 
       }
     }
    return this;
  }
  
  CSV saveConvertedDates() {
    if ( titles.length == 0 ) return this;
    int _column = _.find( "date", titles );
    if ( _column != -1 ) {
      for ( int i = 0; i < rows; i++ ) {
         data[i][ _column ] = convertedDates[i];
      }
    }
    
    convertedDates = null;
    
    return this;
  }
  
  String[] column( String name ) {
    String [] c = {};
    if ( titles.length == 0 ) return null;
    c = new String[rows]; 
    int _column = _.find( name, titles );
    
    if ( _column != -1 ) {
       for ( int i = 0; i < rows; i++ ) {
         c[i] = data[i][_column];
       }
       
       return c;
    } else return null;
    
  }
  
}

