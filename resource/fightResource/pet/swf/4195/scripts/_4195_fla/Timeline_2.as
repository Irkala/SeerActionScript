package _4195_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol191")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,120,frame121,147,frame148);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame121() : *
      {
         hit = 1;
      }
      
      internal function frame148() : *
      {
         stop();
      }
   }
}

