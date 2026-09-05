package _1014_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol25")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,17,frame18,45,frame46);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame18() : *
      {
         hit = 1;
      }
      
      internal function frame46() : *
      {
         stop();
      }
   }
}

