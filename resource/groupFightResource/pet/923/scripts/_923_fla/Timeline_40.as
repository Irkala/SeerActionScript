package _923_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol72")]
   public dynamic class Timeline_40 extends MovieClip
   {
      
      public function Timeline_40()
      {
         super();
         addFrameScript(95,frame96);
      }
      
      internal function frame96() : *
      {
         stop();
         MovieClip(this.parent).gotoAndStop(2);
      }
   }
}

