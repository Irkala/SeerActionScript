package _3964_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol754")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,102,frame103,130,frame131);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame103() : *
      {
         hit = 1;
      }
      
      internal function frame131() : *
      {
         stop();
      }
   }
}

