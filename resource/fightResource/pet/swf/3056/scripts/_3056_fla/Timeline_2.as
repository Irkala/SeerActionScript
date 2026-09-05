package _3056_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol185")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,114,frame115,146,frame147);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame115() : *
      {
         hit = 1;
      }
      
      internal function frame147() : *
      {
         stop();
      }
   }
}

