package _1459_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol28")]
   public dynamic class Timeline_16 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_16()
      {
         super();
         addFrameScript(0,frame1,20,frame21,47,frame48);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame21() : *
      {
         hit = 1;
      }
      
      internal function frame48() : *
      {
         stop();
      }
   }
}

