
static class _ {
  
   static PApplet _;
   static int Z_INDEX = 0;
   
    static void init( PApplet _selfRef ) {
      _ = _selfRef;
    }
    
    static int[] stringArrayToIntArray( String[] sarray ) {
      if (sarray != null) {
        int intarray[] = new int[sarray.length];
        for (int i = 0; i < sarray.length; i++) {
        if ( !sarray[i].equals( "" ) ) intarray[i] = Integer.parseInt(sarray[i]);
        else intarray[i] = 0;
        }
        return intarray;
      }
      return null;
    }
    
    static int find( String val, String[] a ) {
      val = val.toLowerCase();
       for ( int i = 0, len = a.length; i < len; i++ ) {
         if ( val.equals( a[i].toLowerCase() ) ) return i;
       }
       return -1;
    }
    
    static int[] findAll( String val, String[] a ) {
      /*println( 1 );
      println( a );
      println( val );
      println( 2 );*/
      val = val.toLowerCase();
      int[] results = new int[1];
      int totalResults = 0;
      //println( "ARRAY LENGTH: " +  a.length );
       for ( int i = 0, len = a.length; i < len; i++ ) {
         if ( val.equals( a[i].toLowerCase() ) ) {
            //println(  "HI" );
            if ( totalResults >= results.length ) {
               results = ( int[] ) expand( results, results.length + 1 );
            }
            
            results[ totalResults ] = i;
            totalResults++;
            //println( "TOTAL RESULTS: " + totalResults );
         }
       }
       //println( results );
       return results;
    }
    
    static int[] findAllNot( String val, String[] a ) {
      /*println( 1 );
      println( a );
      println( val );
      println( 2 );*/
      val = val.toLowerCase();
      int[] results = new int[1];
      int totalResults = 0;
      //println( "ARRAY LENGTH: " +  a.length );
       for ( int i = 0, len = a.length; i < len; i++ ) {
         if ( !val.equals( a[i].toLowerCase() ) ) {
            //println(  "HI" );
            if ( totalResults >= results.length ) {
               results = ( int[] ) expand( results, results.length + 1 );
            }
            
            results[ totalResults ] = i;
            totalResults++;
            //println( "TOTAL RESULTS: " + totalResults );
         }
       }
       //println( results );
       return results;
    }
    
    static float randomDist( int _i ) {
      return _.random( -_i, _i );
    }
    
    static float randomDist( float _i ) {
      return _.random( -_i, _i );
    }
    
    static float dist( Vec2D a, Vec2D b ) {
      return _.dist( a.x, a.y, b.x, b.y ); 
    }
    
    static int randomInt( int _i1, int _i2 ) {
       return int( _.random( _i1, _i2 ) ); 
    }
    
    static float distance( float _x1, float _y1, float _x2, float _y2 ) {
      //return sqrt( sq( _x1 - _x2 ) + sq( _y1 - _y2 ) );
      a( _x1 - _x2 );
      b( _y1 - _y2 );
      return findC();
    }
    
    static Vec2D difference( Vec2D a, Vec2D b ) {
      return new Vec2D( a.x - b.x, a.y - b.y );
    }
    
    static float distance( float _x1, float _y1, float _x2, float _y2, Boolean _sqrt ) {
      if ( _sqrt ) return sqrt( sq( _x1 - _x2 ) + sq( _y1 - _y2 ) );
      else return sq( _x1 - _x2 ) + sq( _y1 - _y2 );
    }
    
    private static float aSquared;
    private static float bSquared;
    private static float cSquared; 
    
    static void a( float _a ) {
       aSquared = sq( _a );
    }
    
    static void b( float _b ) {
       bSquared = sq( _b );
    }
    
    static void c( float _c ) {
       cSquared = sq( _c );
    }
    
    static float findA() {
     return sqrt( cSquared - bSquared );
    }
    
    static float findB() {
     return sqrt( cSquared - aSquared ); 
    }
    
    static float findC() {
     return sqrt( aSquared + bSquared ); 
    }
    
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// DATE

final static class Date {
   
    final static int MMDDYYYY = 0;
    final static int DDMMYYYY = 1;
    
    final static String convert( String date, int type, int toType, String separator ) {
      if ( date.indexOf( separator ) == -1 ) return "";
      String[] s = split( date, separator );
      String convertedDate = "";
      switch( type ) {
         case Date.DDMMYYYY:
             convertedDate = Date.convertTo( s[1], s[0], s[2], toType, "/" );
          break;
       }
      return convertedDate;
    }
    
    final static String convertTo( String month, String day, String year, int type, String separator ) {
      if ( month.length() < 2 ) month = "0" + month;
      if ( day.length() < 2 ) day = "0" + day;
      if ( year.length() < 4 ) year = "20" + year;
      String d = "";
      switch( type ) {
         case Date.DDMMYYYY:
           d = ( day + separator + month + separator + year );
           break;
         case Date.MMDDYYYY:
           
           d = ( month + separator + day + separator + year );
           break;
       }
       return d;
    }
    
}
