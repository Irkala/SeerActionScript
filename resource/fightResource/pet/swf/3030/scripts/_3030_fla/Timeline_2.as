package _3030_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol192")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,64,frame65,96,frame97);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame65() : *
      {
         hit = 1;
      }
      
      internal function frame97() : *
      {
         stop();
      }
   }
}

