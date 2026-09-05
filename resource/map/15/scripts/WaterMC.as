package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol16")]
   public dynamic class WaterMC extends MovieClip
   {
      
      public function WaterMC()
      {
         super();
         addFrameScript(0,frame1,24,frame25);
      }
      
      internal function frame25() : *
      {
         stop();
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

