package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol7")]
   public dynamic class skill extends MovieClip
   {
      
      public var hit:*;
      
      public var isEnd:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,this.frame1,18,this.frame19);
      }
      
      internal function frame1() : *
      {
         this.hit = 1;
      }
      
      internal function frame19() : *
      {
         stop();
         this.isEnd = 1;
      }
   }
}

