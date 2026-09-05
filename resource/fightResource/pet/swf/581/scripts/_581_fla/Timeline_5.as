package _581_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol8")]
   public dynamic class Timeline_5 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_5()
      {
         super();
         addFrameScript(0,frame1,20,frame21,57,frame58);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame21() : *
      {
         hit = 1;
      }
      
      internal function frame58() : *
      {
         stop();
      }
   }
}

