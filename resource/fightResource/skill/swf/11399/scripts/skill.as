package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol22")]
   public dynamic class skill extends MovieClip
   {
      
      public var isEnd:*;
      
      public var hit:*;
      
      public var __id71_:MovieClip;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,18,frame19);
      }
      
      internal function frame1() : *
      {
         hit = 1;
      }
      
      internal function frame19() : *
      {
         stop();
         isEnd = 1;
      }
   }
}

