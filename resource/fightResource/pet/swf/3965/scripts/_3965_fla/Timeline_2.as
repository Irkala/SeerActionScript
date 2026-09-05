package _3965_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol843")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,123,frame124,148,frame149);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame124() : *
      {
         hit = 1;
      }
      
      internal function frame149() : *
      {
         stop();
      }
   }
}

