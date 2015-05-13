class JSON {
  String data;
  
  JSON() {}
  
  void write( String path ) {
    
    PrintWriter pw = createWriter( path );
    //pw.println( data );
    
    pw.flush();
    pw.close();
  }
  
}
