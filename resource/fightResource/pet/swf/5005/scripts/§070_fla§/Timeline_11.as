package §070_fla§
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol101")]
   public dynamic class Timeline_11 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_11()
      {
         super();
         addFrameScript(0,frame1,27,frame28,73,frame74);
      }
      
      internal function frame28() : *
      {
         hit = 1;
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame74() : *
      {
         stop();
      }
   }
}

