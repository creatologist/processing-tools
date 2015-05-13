
class Categories {
  
  Category[] all = new Category[1];
  int total = 0;

  Categories(){}
  
  void push( Category c ) {
    if ( total >= all.length ) {
       all = ( Category[] ) expand( all, all.length + 1 );
    }
    all[ total ] = c;
    total++;
  }
  
  int hasCategoryID( int ID ) {
    //if ( ID == 1000 ) return ;
    
    for ( int i = 0; i < total; i++ ) {
      if ( ID == all[ i ].ID ) return i; 
    }
    
    return -1;
  }
  
}

class Category {
  
  Product[] all = new Product[1];
  int total = 0;
  
  String name;
  int ID;

  Category( int i, String s ){
    ID = i;
    name = s;
  }
  
  void addProduct( Product p ) {
    //if ( hasCategory( s ) == true ) return; 
    if ( total >= all.length ) {
       all = ( Product[] ) expand( all, all.length + 1 );
    }
    all[ total ] = p;
    total++;
  }
  
}

class CategoryItem {
  
  int ExternalID;
  int CategoryID;
  String CategoryName;
  
 CategoryItem( int eID, int cID, String cName ){
   ExternalID = eID;
   CategoryID = cID;
   CategoryName = cName;
 };
  
}
