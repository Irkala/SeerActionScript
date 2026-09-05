package _4195_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol250")]
   public dynamic class Timeline_114 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_114()
      {
         super();
         addFrameScript(0,frame1,50,frame51,94,frame95);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame51() : *
      {
         hit = 1;
      }
      
      internal function frame95() : *
      {
         stop();
      }
   }
}

