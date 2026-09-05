package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol30")]
   public dynamic class skill extends MovieClip
   {
      
      public var isEnd:*;
      
      public var hit:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,40,frame41,63,frame64);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame41() : *
      {
         hit = 1;
      }
      
      internal function frame64() : *
      {
         stop();
         isEnd = 1;
      }
   }
}

