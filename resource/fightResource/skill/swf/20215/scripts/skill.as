package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol58")]
   public dynamic class skill extends MovieClip
   {
      
      public var hit:*;
      
      public var isEnd:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,36,frame37);
      }
      
      internal function frame37() : *
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

