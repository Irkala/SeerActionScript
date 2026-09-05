package _3007_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol241")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,68,frame69,95,frame96);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame69() : *
      {
         hit = 1;
      }
      
      internal function frame96() : *
      {
         stop();
      }
   }
}

