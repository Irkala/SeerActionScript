package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol131")]
   public dynamic class skill extends MovieClip
   {
      
      public var hit:*;
      
      public var isEnd:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,43,frame44);
      }
      
      internal function frame1() : *
      {
         hit = 1;
      }
      
      internal function frame44() : *
      {
         stop();
         isEnd = 1;
      }
   }
}

