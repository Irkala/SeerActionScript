package _912_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol39")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,18,frame19,41,frame42);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame19() : *
      {
         hit = 1;
      }
      
      internal function frame42() : *
      {
         stop();
      }
   }
}

