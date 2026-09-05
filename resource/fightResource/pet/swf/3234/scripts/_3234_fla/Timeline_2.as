package _3234_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol94")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,55,frame56,79,frame80);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame56() : *
      {
         hit = 1;
      }
      
      internal function frame80() : *
      {
         stop();
      }
   }
}

