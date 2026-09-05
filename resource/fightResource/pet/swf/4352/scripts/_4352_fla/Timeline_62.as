package _4352_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol284")]
   public dynamic class Timeline_62 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_62()
      {
         super();
         addFrameScript(0,frame1,99,frame100,123,frame124);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame100() : *
      {
         hit = 1;
      }
      
      internal function frame124() : *
      {
         stop();
      }
   }
}

