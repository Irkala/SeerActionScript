package _923_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol80")]
   public dynamic class Timeline_43 extends MovieClip
   {
      
      public function Timeline_43()
      {
         super();
         addFrameScript(63,frame64);
      }
      
      internal function frame64() : *
      {
         stop();
         MovieClip(this.parent).gotoAndStop(2);
      }
   }
}

