package §003_fla§
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol113")]
   public dynamic class Timeline_4 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_4()
      {
         super();
         addFrameScript(0,frame1,79,frame80,124,frame125);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame80() : *
      {
         hit = 1;
      }
      
      internal function frame125() : *
      {
         stop();
      }
   }
}

