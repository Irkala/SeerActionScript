package _984_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol25")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,37,frame38,65,frame66);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame38() : *
      {
         hit = 1;
      }
      
      internal function frame66() : *
      {
         stop();
      }
   }
}

