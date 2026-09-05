package _344_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol11")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,75,frame76,123,frame124);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame76() : *
      {
         hit = 1;
      }
      
      internal function frame124() : *
      {
         stop();
      }
   }
}

