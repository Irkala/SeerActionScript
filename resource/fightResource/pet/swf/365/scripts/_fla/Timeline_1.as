package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol94")]
   public dynamic class Timeline_1 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_1()
      {
         super();
         addFrameScript(0,frame1,123,frame124,207,frame208);
      }
      
      internal function frame208() : *
      {
         stop();
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame124() : *
      {
         hit = 1;
      }
   }
}

