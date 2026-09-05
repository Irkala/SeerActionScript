package _1728_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol202")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,this.frame1,81,this.frame82,155,this.frame156);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame82() : *
      {
         this.hit = 1;
      }
      
      internal function frame156() : *
      {
         stop();
      }
   }
}

