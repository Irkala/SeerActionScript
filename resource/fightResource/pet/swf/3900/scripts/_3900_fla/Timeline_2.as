package _3900_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol432")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,99,frame100,128,frame129);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame100() : *
      {
         hit = 1;
      }
      
      internal function frame129() : *
      {
         stop();
      }
   }
}

