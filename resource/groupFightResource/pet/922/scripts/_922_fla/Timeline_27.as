package _922_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol26")]
   public dynamic class Timeline_27 extends MovieClip
   {
      
      public function Timeline_27()
      {
         super();
         addFrameScript(52,frame53);
      }
      
      internal function frame53() : *
      {
         stop();
         MovieClip(this.parent).gotoAndStop(2);
      }
   }
}

