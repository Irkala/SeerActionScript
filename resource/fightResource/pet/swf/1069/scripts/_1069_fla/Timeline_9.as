package _1069_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol229")]
   public dynamic class Timeline_9 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_9()
      {
         super();
         addFrameScript(0,this.frame1,122,this.frame123,163,this.frame164);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame123() : *
      {
         this.hit = 1;
      }
      
      internal function frame164() : *
      {
         stop();
      }
   }
}

