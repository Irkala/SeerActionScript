package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol61")]
   public dynamic class skill extends MovieClip
   {
      
      public var isEnd:*;
      
      public var hit:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,31,frame32);
      }
      
      internal function frame1() : *
      {
         hit = 1;
      }
      
      internal function frame32() : *
      {
         stop();
         isEnd = 1;
      }
   }
}

