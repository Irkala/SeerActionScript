package _3700_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol246")]
   public dynamic class Timeline_50 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_50()
      {
         super();
         addFrameScript(0,this.frame1,25,this.frame26,61,this.frame62);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame26() : *
      {
         this.hit = 1;
      }
      
      internal function frame62() : *
      {
         stop();
      }
   }
}

