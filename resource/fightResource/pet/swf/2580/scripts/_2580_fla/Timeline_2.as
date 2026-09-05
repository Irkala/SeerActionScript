package _2580_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol133")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,86,frame87,111,frame112);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame87() : *
      {
         hit = 1;
      }
      
      internal function frame112() : *
      {
         stop();
      }
   }
}

