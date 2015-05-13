class ImageSequence {
  String [] images;
  String name;
  boolean folder = false;
  
  // constructors
  ImageSequence( String[] images_, String name_ ) {
    _init( images_, name_, false );
  }
  
  ImageSequence( String[] images_, String name_, boolean folder_ ) {
    _init( images_, name_, folder_ );  
  }
  
  void _init( String[] images_, String name_, boolean folder_ ) {
    name = name_;
    images = images_;
    folder = folder_;
    
    println( "new ImageSequence (" + name_ + ")"  );
    println( images_ );
    println( "" );
  };
  
  //
  
  
}
