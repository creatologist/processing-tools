
class Brands {
  
  Brand[] all = new Brand[1];
  int total = 0;

  Brands(){}
  
  void push( Brand b ) {
    if ( total >= all.length ) {
       all = ( Brand[] ) expand( all, all.length + 1 );
    }
    all[ total ] = b;
    total++;
  }
  
  int find( String s ) {
      
    for ( int i = 0; i < total; i++ ) {
      if ( s.equals( all[i].name ) ) return i; 
    }
    
    return -1;
  }
  
}

class Brand {
  String name;
  int count = 1;
 
  Brand( String s ) {
    name = s;
  }
  
  void plus() {
    count++;
  }
}
