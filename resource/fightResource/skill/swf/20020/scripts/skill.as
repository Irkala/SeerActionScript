package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol28")]
   public dynamic class skill extends MovieClip
   {
      
      public var isEnd:*;
      
      public var hit:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,16,frame17,64,frame65);
      }
      
      internal function frame65() : *
      {
         stop();
         isEnd = 1;
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame17() : *
      {
         hit = 1;
      }
   }
}

