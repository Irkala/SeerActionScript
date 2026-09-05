package _3444_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol529")]
   public dynamic class Timeline_57 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_57()
      {
         super();
         addFrameScript(0,this.frame1,31,this.frame32,75,this.frame76);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame32() : *
      {
         this.hit = 1;
      }
      
      internal function frame76() : *
      {
         stop();
      }
   }
}

