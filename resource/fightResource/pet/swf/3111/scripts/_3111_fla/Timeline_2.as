package _3111_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol55")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,45,frame46,70,frame71);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame46() : *
      {
         hit = 1;
      }
      
      internal function frame71() : *
      {
         stop();
      }
   }
}

