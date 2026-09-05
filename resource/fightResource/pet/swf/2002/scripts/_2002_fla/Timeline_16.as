package _2002_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol60")]
   public dynamic class Timeline_16 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_16()
      {
         super();
         addFrameScript(0,frame1,41,frame42,73,frame74);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame42() : *
      {
         hit = 1;
      }
      
      internal function frame74() : *
      {
         stop();
      }
   }
}

