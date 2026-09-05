package _437_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol58")]
   public dynamic class Timeline_6 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_6()
      {
         super();
         addFrameScript(0,frame1,64,frame65,95,frame96);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame65() : *
      {
         hit = 1;
      }
      
      internal function frame96() : *
      {
         stop();
      }
   }
}

