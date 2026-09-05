package §1300026_2_fla§
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,12,frame13);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame13() : *
      {
         gotoAndPlay(2);
      }
   }
}

