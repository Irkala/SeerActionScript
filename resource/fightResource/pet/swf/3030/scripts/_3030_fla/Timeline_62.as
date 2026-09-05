package _3030_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol223")]
   public dynamic class Timeline_62 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_62()
      {
         super();
         addFrameScript(0,frame1,30,frame31,72,frame73);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame31() : *
      {
         hit = 1;
      }
      
      internal function frame73() : *
      {
         stop();
      }
   }
}

