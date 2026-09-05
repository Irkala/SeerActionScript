package §008_fla§
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol64")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,52,frame53,100,frame101);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame101() : *
      {
         stop();
      }
      
      internal function frame53() : *
      {
         hit = 1;
      }
   }
}

