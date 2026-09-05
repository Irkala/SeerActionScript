package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol66")]
   public dynamic class skill extends MovieClip
   {
      
      public var hit:*;
      
      public var isEnd:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,58,frame59);
      }
      
      internal function frame1() : *
      {
         hit = 1;
      }
      
      internal function frame59() : *
      {
         stop();
         isEnd = 1;
      }
   }
}

