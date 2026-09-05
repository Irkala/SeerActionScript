package _922_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol74")]
   public dynamic class Timeline_39 extends MovieClip
   {
      
      public function Timeline_39()
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

