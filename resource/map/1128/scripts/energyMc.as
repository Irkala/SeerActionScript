package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol69")]
   public dynamic class energyMc extends MovieClip
   {
      
      public var mc:MovieClip;
      
      public function energyMc()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

