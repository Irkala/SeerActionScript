package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol174")]
   public dynamic class skill extends MovieClip
   {
      
      public var hit:*;
      
      public var isEnd:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,54,frame55);
      }
      
      internal function frame1() : *
      {
         hit = 1;
      }
      
      internal function frame55() : *
      {
         stop();
         isEnd = 1;
      }
   }
}

