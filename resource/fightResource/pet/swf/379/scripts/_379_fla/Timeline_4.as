package _379_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol35")]
   public dynamic class Timeline_4 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_4()
      {
         super();
         addFrameScript(0,frame1,21,frame22,96,frame97);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame22() : *
      {
         hit = 1;
      }
      
      internal function frame97() : *
      {
         stop();
      }
   }
}

