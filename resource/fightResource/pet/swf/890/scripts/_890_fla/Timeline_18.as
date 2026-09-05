package _890_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol35")]
   public dynamic class Timeline_18 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_18()
      {
         super();
         addFrameScript(0,frame1,15,frame16,61,frame62);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame16() : *
      {
         hit = 1;
      }
      
      internal function frame62() : *
      {
         stop();
      }
   }
}

