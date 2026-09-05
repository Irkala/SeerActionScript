package _923_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol77")]
   public dynamic class Timeline_42 extends MovieClip
   {
      
      public function Timeline_42()
      {
         super();
         addFrameScript(56,frame57);
      }
      
      internal function frame57() : *
      {
         stop();
         MovieClip(this.parent).gotoAndStop(2);
      }
   }
}

