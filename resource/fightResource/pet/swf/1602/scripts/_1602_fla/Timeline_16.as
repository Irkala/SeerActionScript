package _1602_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol32")]
   public dynamic class Timeline_16 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_16()
      {
         super();
         addFrameScript(0,frame1,19,frame20,49,frame50);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame20() : *
      {
         hit = 1;
      }
      
      internal function frame50() : *
      {
         stop();
      }
   }
}

