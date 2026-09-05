package _923_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol85")]
   public dynamic class Timeline_46 extends MovieClip
   {
      
      public function Timeline_46()
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

