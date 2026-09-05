package _4235_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol185")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,119,frame120,147,frame148);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame120() : *
      {
         hit = 1;
      }
      
      internal function frame148() : *
      {
         stop();
      }
   }
}

