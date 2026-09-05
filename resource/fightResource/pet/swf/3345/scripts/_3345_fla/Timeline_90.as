package _3345_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol302")]
   public dynamic class Timeline_90 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_90()
      {
         super();
         addFrameScript(0,frame1,25,frame26,61,frame62);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame26() : *
      {
         hit = 1;
      }
      
      internal function frame62() : *
      {
         stop();
      }
   }
}

