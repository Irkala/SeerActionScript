package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol38")]
   public dynamic class skill extends MovieClip
   {
      
      public var isEnd:*;
      
      public var hit:*;
      
      public var __id71_:MovieClip;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,23,frame24);
      }
      
      internal function frame1() : *
      {
         hit = 1;
      }
      
      internal function frame24() : *
      {
         stop();
         isEnd = 1;
      }
   }
}

