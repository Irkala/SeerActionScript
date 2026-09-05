package _550_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol10")]
   public dynamic class Timeline_6 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_6()
      {
         super();
         addFrameScript(0,frame1,27,frame28,64,frame65);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame28() : *
      {
         hit = 1;
      }
      
      internal function frame65() : *
      {
         stop();
      }
   }
}

