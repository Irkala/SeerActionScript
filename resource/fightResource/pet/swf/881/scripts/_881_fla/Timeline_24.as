package _881_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol61")]
   public dynamic class Timeline_24 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_24()
      {
         super();
         addFrameScript(0,frame1,15,frame16,50,frame51);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame16() : *
      {
         hit = 1;
      }
      
      internal function frame51() : *
      {
         stop();
      }
   }
}

