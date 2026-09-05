package _923_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol81")]
   public dynamic class Timeline_45 extends MovieClip
   {
      
      public function Timeline_45()
      {
         super();
         addFrameScript(34,frame35);
      }
      
      internal function frame35() : *
      {
         stop();
         MovieClip(this.parent).gotoAndStop(2);
      }
   }
}

