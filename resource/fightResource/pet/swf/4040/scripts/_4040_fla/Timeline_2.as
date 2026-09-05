package _4040_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol313")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,119,frame120,158,frame159);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame120() : *
      {
         hit = 1;
      }
      
      internal function frame159() : *
      {
         stop();
      }
   }
}

