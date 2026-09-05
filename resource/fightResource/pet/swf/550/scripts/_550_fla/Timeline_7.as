package _550_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol11")]
   public dynamic class Timeline_7 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_7()
      {
         super();
         addFrameScript(0,frame1,37,frame38,68,frame69);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame38() : *
      {
         hit = 1;
      }
      
      internal function frame69() : *
      {
         stop();
      }
   }
}

