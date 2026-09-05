package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol33")]
   public dynamic class skill extends MovieClip
   {
      
      public var isEnd:*;
      
      public var hit:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,8,frame9,67,frame68);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame9() : *
      {
         hit = 1;
      }
      
      internal function frame68() : *
      {
         stop();
         isEnd = 1;
      }
   }
}

