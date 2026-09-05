package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol156")]
   public dynamic class skill extends MovieClip
   {
      
      public var isEnd:*;
      
      public var hit:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,41,frame42);
      }
      
      internal function frame1() : *
      {
         hit = 1;
      }
      
      internal function frame42() : *
      {
         stop();
         isEnd = 1;
      }
   }
}

