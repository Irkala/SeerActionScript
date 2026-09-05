package _2100_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol128")]
   public dynamic class Timeline_32 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_32()
      {
         super();
         addFrameScript(0,frame1,19,frame20,61,frame62);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame20() : *
      {
         hit = 1;
      }
      
      internal function frame62() : *
      {
         stop();
      }
   }
}

