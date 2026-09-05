package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol201")]
   public dynamic class Timeline_5 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_5()
      {
         super();
         addFrameScript(0,frame1,55,frame56,109,frame110);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame110() : *
      {
         stop();
      }
      
      internal function frame56() : *
      {
         hit = 1;
      }
   }
}

