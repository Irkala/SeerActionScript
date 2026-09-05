package _671_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol27")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,54,frame55,106,frame107);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame55() : *
      {
         hit = 1;
      }
      
      internal function frame107() : *
      {
         stop();
      }
   }
}

