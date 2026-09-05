package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol12")]
   public dynamic class skill extends MovieClip
   {
      
      public var isEnd:*;
      
      public var hit:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,23,frame24,116,frame117);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame24() : *
      {
         hit = 1;
      }
      
      internal function frame117() : *
      {
         stop();
         isEnd = 1;
      }
   }
}

