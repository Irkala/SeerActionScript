package _903_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol20")]
   public dynamic class Timeline_13 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_13()
      {
         super();
         addFrameScript(0,frame1,15,frame16,57,frame58);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame16() : *
      {
         hit = 1;
      }
      
      internal function frame58() : *
      {
         stop();
      }
   }
}

