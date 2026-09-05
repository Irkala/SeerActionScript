package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol4")]
   public dynamic class skill extends MovieClip
   {
      
      public var isEnd:*;
      
      public var hit:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,66,frame67,106,frame107);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame107() : *
      {
         stop();
         isEnd = 1;
      }
      
      internal function frame67() : *
      {
         hit = 1;
      }
   }
}

