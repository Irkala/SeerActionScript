package _507_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol119")]
   public dynamic class Timeline_7 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_7()
      {
         super();
         addFrameScript(0,frame1,51,frame52,96,frame97);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame52() : *
      {
         hit = 1;
      }
      
      internal function frame97() : *
      {
         stop();
      }
   }
}

