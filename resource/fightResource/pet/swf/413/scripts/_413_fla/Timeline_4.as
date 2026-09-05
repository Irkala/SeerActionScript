package _413_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol65")]
   public dynamic class Timeline_4 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_4()
      {
         super();
         addFrameScript(0,frame1,91,frame92,145,frame146);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame92() : *
      {
         hit = 1;
      }
      
      internal function frame146() : *
      {
         stop();
      }
   }
}

