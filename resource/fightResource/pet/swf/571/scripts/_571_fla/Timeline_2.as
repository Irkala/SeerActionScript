package _571_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol8")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,43,frame44,68,frame69);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame44() : *
      {
         hit = 1;
      }
      
      internal function frame69() : *
      {
         stop();
      }
   }
}

