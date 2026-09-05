package _2686_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol223")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,69,frame70,93,frame94);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame70() : *
      {
         hit = 1;
      }
      
      internal function frame94() : *
      {
         stop();
      }
   }
}

