package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol15")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,66,frame67,120,frame121);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame121() : *
      {
         stop();
      }
      
      internal function frame67() : *
      {
         hit = 1;
      }
   }
}

