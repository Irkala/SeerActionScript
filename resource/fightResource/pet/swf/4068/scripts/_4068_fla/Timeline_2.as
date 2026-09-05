package _4068_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol201")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,100,frame101,146,frame147);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame101() : *
      {
         hit = 1;
      }
      
      internal function frame147() : *
      {
         stop();
      }
   }
}

