package _455_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol275")]
   public dynamic class Timeline_118 extends MovieClip
   {
      
      public function Timeline_118()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         stop();
         this.parent.visible = false;
      }
   }
}

