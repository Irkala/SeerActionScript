package _923_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol52")]
   public dynamic class Timeline_35 extends MovieClip
   {
      
      public function Timeline_35()
      {
         super();
         addFrameScript(80,frame81);
      }
      
      internal function frame81() : *
      {
         stop();
         MovieClip(this.parent).gotoAndStop(2);
      }
   }
}

