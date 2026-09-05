package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol9")]
   public dynamic class skill extends MovieClip
   {
      
      public var isEnd:*;
      
      public var hit:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,30,frame31,61,frame62);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame31() : *
      {
         hit = 1;
      }
      
      internal function frame62() : *
      {
         stop();
         isEnd = 1;
      }
   }
}

