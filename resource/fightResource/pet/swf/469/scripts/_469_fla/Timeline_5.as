package _469_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol17")]
   public dynamic class Timeline_5 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_5()
      {
         super();
         addFrameScript(0,frame1,40,frame41,80,frame81);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame41() : *
      {
         hit = 1;
      }
      
      internal function frame81() : *
      {
         stop();
      }
   }
}

