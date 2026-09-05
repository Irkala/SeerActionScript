package _3465_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol520")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,91,frame92,121,frame122);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame92() : *
      {
         hit = 1;
      }
      
      internal function frame122() : *
      {
         stop();
      }
   }
}

