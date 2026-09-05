package _380_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol41")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,98,frame99,199,frame200);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame99() : *
      {
         hit = 1;
      }
      
      internal function frame200() : *
      {
         stop();
      }
   }
}

