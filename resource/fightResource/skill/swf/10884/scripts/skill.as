package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol64")]
   public dynamic class skill extends MovieClip
   {
      
      public var isEnd:*;
      
      public var hit:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,28,frame29);
      }
      
      internal function frame1() : *
      {
         hit = 1;
      }
      
      internal function frame29() : *
      {
         stop();
         isEnd = 1;
      }
   }
}

