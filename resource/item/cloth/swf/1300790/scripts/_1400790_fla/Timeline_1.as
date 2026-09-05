package _1400790_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol4")]
   public dynamic class Timeline_1 extends MovieClip
   {
      
      public function Timeline_1()
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

