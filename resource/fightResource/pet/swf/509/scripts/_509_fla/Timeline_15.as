package _509_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol30")]
   public dynamic class Timeline_15 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_15()
      {
         super();
         addFrameScript(0,frame1,15,frame16,68,frame69);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame16() : *
      {
         hit = 1;
      }
      
      internal function frame69() : *
      {
         stop();
      }
   }
}

