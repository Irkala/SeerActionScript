package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol11")]
   public dynamic class skill extends MovieClip
   {
      
      public var isEnd:*;
      
      public var hit:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,48,frame49,94,frame95);
      }
      
      internal function frame95() : *
      {
         stop();
         isEnd = 1;
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame49() : *
      {
         hit = 1;
      }
   }
}

