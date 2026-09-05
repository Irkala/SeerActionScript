package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol75")]
   public dynamic class skill extends MovieClip
   {
      
      public var isEnd:*;
      
      public var hit:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,48,this.frame49);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         this.hit = 1;
      }
      
      internal function frame49() : *
      {
         stop();
         this.isEnd = 1;
      }
   }
}

