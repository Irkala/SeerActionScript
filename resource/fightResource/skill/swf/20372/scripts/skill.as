package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol47")]
   public dynamic class skill extends MovieClip
   {
      
      public var isEnd:*;
      
      public var hit:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,19,frame20);
      }
      
      internal function frame1() : *
      {
         hit = 1;
      }
      
      internal function frame20() : *
      {
         stop();
         isEnd = 1;
      }
   }
}

