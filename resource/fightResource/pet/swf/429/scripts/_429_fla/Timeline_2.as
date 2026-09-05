package _429_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol31")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,43,frame44,98,frame99);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame44() : *
      {
         hit = 1;
      }
      
      internal function frame99() : *
      {
         stop();
      }
   }
}

