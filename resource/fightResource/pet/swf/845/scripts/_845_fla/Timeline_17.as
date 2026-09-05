package _845_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol33")]
   public dynamic class Timeline_17 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_17()
      {
         super();
         addFrameScript(0,frame1,10,frame11,49,frame50);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame11() : *
      {
         hit = 1;
      }
      
      internal function frame50() : *
      {
         stop();
      }
   }
}

