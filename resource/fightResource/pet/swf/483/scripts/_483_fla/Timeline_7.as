package _483_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol26")]
   public dynamic class Timeline_7 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_7()
      {
         super();
         addFrameScript(0,frame1,30,frame31,91,frame92);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame31() : *
      {
         hit = 1;
      }
      
      internal function frame92() : *
      {
         stop();
      }
   }
}

