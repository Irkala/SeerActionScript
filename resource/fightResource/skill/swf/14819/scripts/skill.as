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
         addFrameScript(0,frame1,44,frame45);
      }
      
      internal function frame1() : *
      {
         hit = 1;
      }
      
      internal function frame45() : *
      {
         stop();
         isEnd = 1;
      }
   }
}

