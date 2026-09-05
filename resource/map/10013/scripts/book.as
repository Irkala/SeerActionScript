package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol5")]
   public dynamic class book extends MovieClip
   {
      
      public function book()
      {
         super();
         addFrameScript(0,frame1,66,frame67);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame67() : *
      {
         stop();
      }
   }
}

