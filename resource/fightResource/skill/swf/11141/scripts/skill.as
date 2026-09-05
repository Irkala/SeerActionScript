package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol37")]
   public dynamic class skill extends MovieClip
   {
      
      public var isEnd:*;
      
      public var hit:*;
      
      public var __id71_:MovieClip;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,21,frame22);
      }
      
      internal function frame1() : *
      {
         hit = 1;
      }
      
      internal function frame22() : *
      {
         stop();
         isEnd = 1;
      }
   }
}

