package _497_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol64")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,64,frame65,95,frame96);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame65() : *
      {
         hit = 1;
      }
      
      internal function frame96() : *
      {
         stop();
      }
   }
}

