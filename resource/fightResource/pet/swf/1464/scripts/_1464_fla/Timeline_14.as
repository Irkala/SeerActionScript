package _1464_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol26")]
   public dynamic class Timeline_14 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_14()
      {
         super();
         addFrameScript(0,frame1,20,frame21,55,frame56);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame21() : *
      {
         hit = 1;
      }
      
      internal function frame56() : *
      {
         stop();
      }
   }
}

