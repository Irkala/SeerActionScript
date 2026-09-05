package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol21")]
   public dynamic class skill extends MovieClip
   {
      
      public var isEnd:*;
      
      public var hit:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,8,frame9,48,frame49);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame9() : *
      {
         hit = 1;
      }
      
      internal function frame49() : *
      {
         stop();
         isEnd = 1;
      }
   }
}

