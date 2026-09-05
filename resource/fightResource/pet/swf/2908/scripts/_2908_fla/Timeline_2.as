package _2908_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol166")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,148,frame149,214,frame215);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame149() : *
      {
         hit = 1;
      }
      
      internal function frame215() : *
      {
         stop();
      }
   }
}

