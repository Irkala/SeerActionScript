package _375_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol260")]
   public dynamic class Timeline_6 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_6()
      {
         super();
         addFrameScript(0,frame1,104,frame105,147,frame148);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame105() : *
      {
         hit = 1;
      }
      
      internal function frame148() : *
      {
         stop();
      }
   }
}

