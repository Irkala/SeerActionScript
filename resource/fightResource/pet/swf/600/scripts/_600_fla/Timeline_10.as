package _600_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol30")]
   public dynamic class Timeline_10 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_10()
      {
         super();
         addFrameScript(0,frame1,18,frame19,57,frame58);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame19() : *
      {
         hit = 1;
      }
      
      internal function frame58() : *
      {
         stop();
      }
   }
}

