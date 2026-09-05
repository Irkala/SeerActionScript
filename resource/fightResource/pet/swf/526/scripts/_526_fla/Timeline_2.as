package _526_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol10")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,34,frame35,62,frame63);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame35() : *
      {
         hit = 1;
      }
      
      internal function frame63() : *
      {
         stop();
      }
   }
}

