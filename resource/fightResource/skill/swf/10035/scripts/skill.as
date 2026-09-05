package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol60")]
   public dynamic class skill extends MovieClip
   {
      
      public var isEnd:*;
      
      public var hit:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,14,frame15,103,frame104);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame104() : *
      {
         stop();
         isEnd = 1;
      }
      
      internal function frame15() : *
      {
         hit = 1;
      }
   }
}

