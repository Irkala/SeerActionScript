package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3")]
   public dynamic class Timeline_6 extends MovieClip
   {
      
      public function Timeline_6()
      {
         addFrameScript(0,this.frame1,12,this.frame13);
         super();
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

