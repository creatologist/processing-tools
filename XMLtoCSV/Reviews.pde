
class Reviews {
  
  Review[] all = new Review[1];
  int total = 0;

  Reviews(){}
  
  void push( Review r ) {
    if ( total >= all.length ) {
       all = ( Review[] ) expand( all, all.length + 1 );
    }
    all[ total ] = r;
    total++;
  }
  
}

class Review {
  int id;
 
  String Title;
  String Text;
  
  String Gender;
  
  String[] ProTags;
  String[] ConTags;
  
  int RatedBatteryLife;
  int RatedLookAndFeel;
  int RatedMedia;
  int RatedPerformance;
  int RatedPhoneFeatures;
  int RatedValue;
  
}
