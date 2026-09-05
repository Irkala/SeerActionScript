package _4386_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol360")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,159,frame160,188,frame189);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame160() : *
      {
         hit = 1;
      }
      
      internal function frame189() : *
      {
         stop();
      }
   }
}

