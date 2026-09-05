package _480_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol12")]
   public dynamic class Timeline_7 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_7()
      {
         super();
         addFrameScript(0,frame1,53,frame54,89,frame90);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame54() : *
      {
         hit = 1;
      }
      
      internal function frame90() : *
      {
         stop();
      }
   }
}

