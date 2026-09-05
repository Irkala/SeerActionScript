package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol5")]
   public dynamic class BloodBar extends MovieClip
   {
      
      public function BloodBar()
      {
         super();
         addFrameScript(0,frame1,39,frame40);
      }
      
      internal function frame40() : *
      {
         stop();
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

