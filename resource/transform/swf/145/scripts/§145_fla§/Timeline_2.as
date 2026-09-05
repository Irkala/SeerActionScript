package §145_fla§
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol24")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,16,frame17);
      }
      
      internal function frame17() : *
      {
         gotoAndPlay(2);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

