package _430_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol168")]
   public dynamic class Timeline_7 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_7()
      {
         super();
         addFrameScript(0,frame1,41,frame42,91,frame92);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame42() : *
      {
         hit = 1;
      }
      
      internal function frame92() : *
      {
         stop();
      }
   }
}

