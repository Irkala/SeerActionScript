package _413_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol53")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,270,frame271,380,frame381);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame271() : *
      {
         hit = 1;
      }
      
      internal function frame381() : *
      {
         stop();
      }
   }
}

