package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol21")]
   public dynamic class skill extends MovieClip
   {
      
      public var hit:*;
      
      public var isEnd:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,14,frame15);
      }
      
      internal function frame15() : *
      {
         stop();
         isEnd = 1;
      }
      
      internal function frame1() : *
      {
         hit = 1;
      }
   }
}

