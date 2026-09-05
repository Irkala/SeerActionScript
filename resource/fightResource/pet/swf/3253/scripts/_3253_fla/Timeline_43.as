package _3253_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol169")]
   public dynamic class Timeline_43 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_43()
      {
         super();
         addFrameScript(0,frame1,29,frame30,60,frame61);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame30() : *
      {
         hit = 1;
      }
      
      internal function frame61() : *
      {
         stop();
      }
   }
}

