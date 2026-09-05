package _922_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol79")]
   public dynamic class Timeline_42 extends MovieClip
   {
      
      public function Timeline_42()
      {
         super();
         addFrameScript(75,frame76);
      }
      
      internal function frame76() : *
      {
         stop();
         MovieClip(this.parent).gotoAndStop(2);
      }
   }
}

