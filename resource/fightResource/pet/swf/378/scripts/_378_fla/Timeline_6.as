package _378_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol40")]
   public dynamic class Timeline_6 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_6()
      {
         super();
         addFrameScript(0,frame1,65,frame66,103,frame104);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame66() : *
      {
         hit = 1;
      }
      
      internal function frame104() : *
      {
         stop();
      }
   }
}

