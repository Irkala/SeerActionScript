package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol35")]
   public dynamic class Timeline_5 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_5()
      {
         super();
         addFrameScript(0,frame1,75,frame76,101,frame102);
      }
      
      internal function frame76() : *
      {
         hit = 1;
      }
      
      internal function frame102() : *
      {
         stop();
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

