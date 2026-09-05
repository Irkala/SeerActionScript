package _4173_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol320")]
   public dynamic class Timeline_36 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_36()
      {
         super();
         addFrameScript(0,frame1,55,frame56,85,frame86);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame56() : *
      {
         hit = 1;
      }
      
      internal function frame86() : *
      {
         stop();
      }
   }
}

