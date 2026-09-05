package _999_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol37")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,55,frame56,78,frame79);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame56() : *
      {
         hit = 1;
      }
      
      internal function frame79() : *
      {
         stop();
      }
   }
}

