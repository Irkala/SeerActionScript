package _922_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol66")]
   public dynamic class Timeline_36 extends MovieClip
   {
      
      public function Timeline_36()
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

