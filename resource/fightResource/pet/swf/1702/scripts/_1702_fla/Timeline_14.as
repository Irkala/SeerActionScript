package _1702_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol32")]
   public dynamic class Timeline_14 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_14()
      {
         super();
         addFrameScript(0,frame1,17,frame18,49,frame50);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame18() : *
      {
         hit = 1;
      }
      
      internal function frame50() : *
      {
         stop();
      }
   }
}

