package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol58")]
   public dynamic class Timeline_4 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_4()
      {
         super();
         addFrameScript(0,frame1,94,frame95,105,frame106);
      }
      
      internal function frame95() : *
      {
         hit = 1;
      }
      
      internal function frame106() : *
      {
         stop();
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

