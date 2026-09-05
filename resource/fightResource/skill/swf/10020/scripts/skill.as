package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol69")]
   public dynamic class skill extends MovieClip
   {
      
      public var isEnd:*;
      
      public var hit:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,11,frame12,72,frame73);
      }
      
      internal function frame73() : *
      {
         stop();
         isEnd = 1;
      }
      
      internal function frame12() : *
      {
         hit = 1;
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

