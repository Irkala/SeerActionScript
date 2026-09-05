package _515_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol13")]
   public dynamic class Timeline_5 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_5()
      {
         super();
         addFrameScript(0,frame1,36,frame37,83,frame84);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame37() : *
      {
         hit = 1;
      }
      
      internal function frame84() : *
      {
         stop();
      }
   }
}

