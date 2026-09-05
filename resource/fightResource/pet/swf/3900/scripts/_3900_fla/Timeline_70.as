package _3900_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol481")]
   public dynamic class Timeline_70 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_70()
      {
         super();
         addFrameScript(0,frame1,75,frame76,119,frame120);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame76() : *
      {
         hit = 1;
      }
      
      internal function frame120() : *
      {
         stop();
      }
   }
}

