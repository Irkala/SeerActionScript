package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol110")]
   public dynamic class skill extends MovieClip
   {
      
      public var isEnd:*;
      
      public var hit:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,1,frame2,32,frame33);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         hit = 1;
      }
      
      internal function frame33() : *
      {
         stop();
         isEnd = 1;
      }
   }
}

