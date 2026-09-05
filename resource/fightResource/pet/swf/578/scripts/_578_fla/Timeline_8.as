package _578_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol10")]
   public dynamic class Timeline_8 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_8()
      {
         super();
         addFrameScript(0,frame1,43,frame44,83,frame84);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame44() : *
      {
         hit = 1;
      }
      
      internal function frame84() : *
      {
         stop();
      }
   }
}

