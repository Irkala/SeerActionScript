package _2600_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol114")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,57,frame58,87,frame88);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame58() : *
      {
         hit = 1;
      }
      
      internal function frame88() : *
      {
         stop();
      }
   }
}

