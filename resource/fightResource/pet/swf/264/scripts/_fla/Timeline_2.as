package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol66")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,95,frame96,183,frame184);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame96() : *
      {
         hit = 1;
      }
      
      internal function frame184() : *
      {
         stop();
      }
   }
}

