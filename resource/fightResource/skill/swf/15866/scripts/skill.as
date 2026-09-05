package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol70")]
   public dynamic class skill extends MovieClip
   {
      
      public var hit:*;
      
      public var isEnd:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,16,frame17);
      }
      
      internal function frame1() : *
      {
         hit = 1;
      }
      
      internal function frame17() : *
      {
         stop();
         isEnd = 1;
      }
   }
}

