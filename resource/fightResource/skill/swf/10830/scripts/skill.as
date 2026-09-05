package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol88")]
   public dynamic class skill extends MovieClip
   {
      
      public var isEnd:*;
      
      public var hit:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,75,frame76);
      }
      
      internal function frame76() : *
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

