package _1154_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol43")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,49,frame50,106,frame107);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame50() : *
      {
         hit = 1;
      }
      
      internal function frame107() : *
      {
         stop();
      }
   }
}

