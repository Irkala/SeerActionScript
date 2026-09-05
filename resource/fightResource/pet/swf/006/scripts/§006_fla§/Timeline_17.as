package §006_fla§
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol100")]
   public dynamic class Timeline_17 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_17()
      {
         super();
         addFrameScript(0,frame1,18,frame19,85,frame86);
      }
      
      internal function frame86() : *
      {
         stop();
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame19() : *
      {
         hit = 1;
      }
   }
}

