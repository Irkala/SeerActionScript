package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol16")]
   public dynamic class Timeline_5 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_5()
      {
         super();
         addFrameScript(0,frame1,32,frame33,82,frame83);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame83() : *
      {
         stop();
      }
      
      internal function frame33() : *
      {
         hit = 1;
      }
   }
}

