package §015_fla§
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol96")]
   public dynamic class Timeline_20 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_20()
      {
         super();
         addFrameScript(0,frame1,23,frame24,125,frame126);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame24() : *
      {
         hit = 1;
      }
      
      internal function frame126() : *
      {
         stop();
      }
   }
}

