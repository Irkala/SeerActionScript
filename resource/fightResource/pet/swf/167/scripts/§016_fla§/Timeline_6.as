package §016_fla§
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol111")]
   public dynamic class Timeline_6 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_6()
      {
         super();
         addFrameScript(0,frame1,66,frame67,124,frame125);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame125() : *
      {
         stop();
      }
      
      internal function frame67() : *
      {
         hit = 1;
      }
   }
}

