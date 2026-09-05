package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol18")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,43,frame44,136,frame137);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame44() : *
      {
         hit = 1;
      }
      
      internal function frame137() : *
      {
         stop();
      }
   }
}

