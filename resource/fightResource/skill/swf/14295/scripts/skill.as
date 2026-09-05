package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol40")]
   public dynamic class skill extends MovieClip
   {
      
      public var hit:*;
      
      public var isEnd:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,this.frame1,25,this.frame26);
      }
      
      internal function frame1() : *
      {
         this.hit = 1;
      }
      
      internal function frame26() : *
      {
         stop();
         this.isEnd = 1;
      }
   }
}

