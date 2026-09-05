package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol22")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,75,frame76,176,frame177);
      }
      
      internal function frame76() : *
      {
         hit = 1;
      }
      
      internal function frame177() : *
      {
         stop();
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

