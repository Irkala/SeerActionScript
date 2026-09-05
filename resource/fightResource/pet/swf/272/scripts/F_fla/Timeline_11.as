package F_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol16")]
   public dynamic class Timeline_11 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_11()
      {
         super();
         addFrameScript(0,frame1,17,frame18,74,frame75);
      }
      
      internal function frame75() : *
      {
         stop();
      }
      
      internal function frame18() : *
      {
         hit = 1;
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

