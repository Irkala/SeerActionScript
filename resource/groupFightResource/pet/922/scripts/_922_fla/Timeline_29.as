package _922_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol29")]
   public dynamic class Timeline_29 extends MovieClip
   {
      
      public function Timeline_29()
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

