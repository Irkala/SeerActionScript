package _721_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol12")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,35,frame36,86,frame87);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame36() : *
      {
         hit = 1;
      }
      
      internal function frame87() : *
      {
         stop();
      }
   }
}

