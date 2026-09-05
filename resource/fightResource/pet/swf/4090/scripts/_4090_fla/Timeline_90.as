package _4090_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol235")]
   public dynamic class Timeline_90 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_90()
      {
         super();
         addFrameScript(0,frame1,99,frame100,131,frame132);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame100() : *
      {
         hit = 1;
      }
      
      internal function frame132() : *
      {
         stop();
      }
   }
}

