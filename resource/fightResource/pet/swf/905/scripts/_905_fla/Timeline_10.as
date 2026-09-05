package _905_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol31")]
   public dynamic class Timeline_10 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_10()
      {
         super();
         addFrameScript(0,frame1,15,frame16,49,frame50);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame16() : *
      {
         hit = 1;
      }
      
      internal function frame50() : *
      {
         stop();
      }
   }
}

