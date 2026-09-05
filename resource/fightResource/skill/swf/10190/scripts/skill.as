package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol102")]
   public dynamic class skill extends MovieClip
   {
      
      public var hit:*;
      
      public var isEnd:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,this.frame1,22,this.frame23);
      }
      
      internal function frame1() : *
      {
         this.hit = 1;
      }
      
      internal function frame23() : *
      {
         stop();
         this.isEnd = 1;
      }
   }
}

