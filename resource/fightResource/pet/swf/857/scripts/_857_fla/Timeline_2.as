package _857_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol25")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,38,frame39,76,frame77);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame39() : *
      {
         hit = 1;
      }
      
      internal function frame77() : *
      {
         stop();
      }
   }
}

