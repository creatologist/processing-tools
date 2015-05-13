class Product {
   
   String Source;
   
   int ExternalID;
   int ID;
   
   String Name;
   String Description;
   
   String ImageUrl;
   String ProductPageUrl;
   String ProductReviewsUrl;
   
   String Brand;
   
   //CategoryItem[] CategoryItems;
   String Category;
   int CategoryID;
   
   float AverageOverallRating;
   int TotalReviewCount;
   int RecommendedCount;
   
   float AvgPerformance;
   float AvgMedia;
   float AvgPhoneFeatures;
   float AvgValue;
   float AvgLookFeel;
   float AvgBatteryLife;
   
   Reviews reviews;
   
   int RatingValue1;
   int RatingValue2;
   int RatingValue3;
   int RatingValue4;
   int RatingValue5;
   
   Product(){
     reviews = new Reviews();
   }
   
   Product( XML xml ){
     reviews = new Reviews();
     
     ID                 = xml.getInt( "id" );
     
     Source             = xml.getChild( "Source" ).getContent();
     
     Name               = xml.getChild( "Name" ).getContent();
     Description        = xml.getChild( "Description" ).getContent();
     
     ImageUrl           = xml.getChild( "ImageUrl" ).getContent();
     ProductPageUrl     = xml.getChild( "ProductPageUrl" ).getContent();
     
     try {
       ProductReviewsUrl  = xml.getChild( "ProductReviewsUrl" ).getContent(); 
     } catch ( Exception e ) {
       
     }
     
     Brand              = xml.getChild( "Brand" ).getContent();
     
     XML stats          = xml.getChild( "ReviewStatistics" );
     
     //println( ID + " :: " + Name );
     //println( stats );
     
     try {
       AverageOverallRating  = new Float( stats.getChild( "AverageOverallRating" ).getContent() ); 
     } catch ( Exception e ) {
       AverageOverallRating  = 5.0;
     }
     
     TotalReviewCount   = parseInt( stats.getChild( "TotalReviewCount" ).getContent() );
     RecommendedCount   = parseInt( stats.getChild( "RecommendedCount" ).getContent() );
     
     XML[] avg          = stats.getChild( "AverageRatingValues" ).getChildren( "AverageRatingValue" );
     
     for ( int i = 0, max = avg.length; i < max; i++ ) {
       float f = new Float( avg[i].getChild( "AverageRating" ).getContent() );
       String id = avg[i].getString( "id" );
       
       if ( id == "Performance" ) AvgPerformance = f;
       else if ( id == "Media" ) AvgMedia = f;
       else if ( id == "PhoneFeatures" ) AvgPhoneFeatures = f;
       else if ( id == "Value" ) AvgValue = f;
       else if ( id == "LookAndFeel" ) AvgLookFeel = f;
       else if ( id == "BatteryLife" ) AvgBatteryLife = f;  
     }
     
     XML[] distribution = stats.getChild( "RatingDistribution" ).getChildren( "RatingDistributionItem" );
     
     for ( int i = 0, max = distribution.length; i < max; i++ ) {
       int rating = parseInt( distribution[i].getChild( "Count" ).getContent() );
       int value = parseInt( distribution[i].getChild( "RatingValue" ).getContent() );
       
       if ( value == 1 ) RatingValue1 = rating;
       else if ( value == 2 ) RatingValue2 = rating;
       else if ( value == 3 ) RatingValue3 = rating;
       else if ( value == 4 ) RatingValue4 = rating;
       else if ( value == 5 ) RatingValue5 = rating;
     }
     
     
   }
  
}


