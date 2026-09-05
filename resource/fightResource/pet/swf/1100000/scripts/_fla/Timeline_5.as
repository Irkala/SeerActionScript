package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol13")]
   public dynamic class Timeline_5 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_5()
      {
         addFrameScript(0,this.frame1,28,this.frame29,88,this.frame89);
         super();
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame29() : *
      {
         this.hit = 1;
      }
      
      internal function frame89() : *
      {
         stop();
      }
   }
}

