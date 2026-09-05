package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol60")]
   public dynamic class skill extends MovieClip
   {
      
      public var isEnd:*;
      
      public var hit:*;
      
      public var __id71_:MovieClip;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,1,frame2,18,frame19);
      }
      
      internal function frame2() : *
      {
         hit = 1;
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame19() : *
      {
         stop();
         isEnd = 1;
      }
   }
}

