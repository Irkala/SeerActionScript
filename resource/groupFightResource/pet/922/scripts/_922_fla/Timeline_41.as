package _922_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol75")]
   public dynamic class Timeline_41 extends MovieClip
   {
      
      public function Timeline_41()
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

