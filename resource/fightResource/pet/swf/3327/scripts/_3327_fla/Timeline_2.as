package _3327_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol401")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,95,frame96,123,frame124);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame96() : *
      {
         hit = 1;
      }
      
      internal function frame124() : *
      {
         stop();
      }
   }
}

