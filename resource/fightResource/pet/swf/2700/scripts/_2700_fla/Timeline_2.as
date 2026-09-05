package _2700_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol209")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,73,frame74,100,frame101);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame74() : *
      {
         hit = 1;
      }
      
      internal function frame101() : *
      {
         stop();
      }
   }
}

