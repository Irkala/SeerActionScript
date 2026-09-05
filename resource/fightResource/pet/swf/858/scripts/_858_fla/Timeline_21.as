package _858_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol41")]
   public dynamic class Timeline_21 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_21()
      {
         super();
         addFrameScript(0,frame1,32,frame33,65,frame66);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame33() : *
      {
         hit = 1;
      }
      
      internal function frame66() : *
      {
         stop();
      }
   }
}

