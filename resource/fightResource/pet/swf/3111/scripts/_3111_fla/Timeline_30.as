package _3111_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol102")]
   public dynamic class Timeline_30 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_30()
      {
         super();
         addFrameScript(0,frame1,28,frame29,66,frame67);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame29() : *
      {
         hit = 1;
      }
      
      internal function frame67() : *
      {
         stop();
      }
   }
}

