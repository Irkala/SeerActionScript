package §025_fla§
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol39")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,28,frame29,73,frame74);
      }
      
      internal function frame29() : *
      {
         hit = 1;
      }
      
      internal function frame74() : *
      {
         stop();
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

