package _544_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol50")]
   public dynamic class Timeline_10 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_10()
      {
         super();
         addFrameScript(0,frame1,34,frame35,72,frame73);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame35() : *
      {
         hit = 1;
      }
      
      internal function frame73() : *
      {
         stop();
      }
   }
}

