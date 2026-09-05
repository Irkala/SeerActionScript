package _922_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol46")]
   public dynamic class Timeline_31 extends MovieClip
   {
      
      public function Timeline_31()
      {
         super();
         addFrameScript(80,frame81);
      }
      
      internal function frame81() : *
      {
         stop();
         MovieClip(this.parent).gotoAndStop(2);
      }
   }
}

