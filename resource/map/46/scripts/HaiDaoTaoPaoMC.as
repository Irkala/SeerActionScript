package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol28")]
   public dynamic class HaiDaoTaoPaoMC extends MovieClip
   {
      
      public function HaiDaoTaoPaoMC()
      {
         super();
         addFrameScript(0,frame1,41,frame42);
      }
      
      internal function frame42() : *
      {
         gotoAndStop(1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

