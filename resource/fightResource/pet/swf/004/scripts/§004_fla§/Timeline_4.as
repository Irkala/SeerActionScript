package §004_fla§
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol80")]
   public dynamic class Timeline_4 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_4()
      {
         super();
         addFrameScript(0,frame1,40,frame41,124,frame125);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame125() : *
      {
         stop();
      }
      
      internal function frame41() : *
      {
         hit = 1;
      }
   }
}

