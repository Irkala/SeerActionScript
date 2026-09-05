package §034_fla§
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol211")]
   public dynamic class Timeline_3 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_3()
      {
         super();
         addFrameScript(0,frame1,70,frame71,111,frame112);
      }
      
      internal function frame71() : *
      {
         hit = 1;
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame112() : *
      {
         stop();
      }
   }
}

