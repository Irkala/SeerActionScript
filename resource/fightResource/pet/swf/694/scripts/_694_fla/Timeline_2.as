package _694_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol19")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,41,frame42,83,frame84);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame42() : *
      {
         hit = 1;
      }
      
      internal function frame84() : *
      {
         stop();
      }
   }
}

