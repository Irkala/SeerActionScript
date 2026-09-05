package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol34")]
   public dynamic class skill extends MovieClip
   {
      
      public var hit:*;
      
      public var isEnd:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,26,frame27);
      }
      
      internal function frame1() : *
      {
         hit = 1;
      }
      
      internal function frame27() : *
      {
         stop();
         isEnd = 1;
      }
   }
}

