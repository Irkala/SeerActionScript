package _572_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol11")]
   public dynamic class Timeline_6 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_6()
      {
         super();
         addFrameScript(0,frame1,36,frame37,75,frame76);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame37() : *
      {
         hit = 1;
      }
      
      internal function frame76() : *
      {
         stop();
      }
   }
}

