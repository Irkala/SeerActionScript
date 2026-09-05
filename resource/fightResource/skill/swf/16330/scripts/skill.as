package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol31")]
   public dynamic class skill extends MovieClip
   {
      
      public var hit:*;
      
      public var isEnd:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,15,frame16);
      }
      
      internal function frame1() : *
      {
         hit = 1;
      }
      
      internal function frame16() : *
      {
         stop();
         isEnd = 1;
      }
   }
}

