package _3326_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol140")]
   public dynamic class Timeline_50 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_50()
      {
         super();
         addFrameScript(0,this.frame1,30,this.frame31,71,this.frame72);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame31() : *
      {
         this.hit = 1;
      }
      
      internal function frame72() : *
      {
         stop();
      }
   }
}

