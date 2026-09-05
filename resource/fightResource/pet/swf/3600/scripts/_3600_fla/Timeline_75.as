package _3600_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol529")]
   public dynamic class Timeline_75 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_75()
      {
         super();
         addFrameScript(0,frame1,30,frame31,65,frame66);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame31() : *
      {
         hit = 1;
      }
      
      internal function frame66() : *
      {
         stop();
      }
   }
}

