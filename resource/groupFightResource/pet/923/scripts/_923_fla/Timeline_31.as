package _923_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol32")]
   public dynamic class Timeline_31 extends MovieClip
   {
      
      public function Timeline_31()
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

