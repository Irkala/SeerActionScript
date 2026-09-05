package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol75")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,66,frame67,144,frame145);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame145() : *
      {
         stop();
      }
      
      internal function frame67() : *
      {
         hit = 1;
      }
   }
}

