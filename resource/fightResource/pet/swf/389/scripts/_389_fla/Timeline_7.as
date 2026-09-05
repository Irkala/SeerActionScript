package _389_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol128")]
   public dynamic class Timeline_7 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_7()
      {
         super();
         addFrameScript(0,frame1,20,frame21,69,frame70);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame21() : *
      {
         hit = 1;
      }
      
      internal function frame70() : *
      {
         stop();
      }
   }
}

