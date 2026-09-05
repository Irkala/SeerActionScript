package _3464_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol407")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,105,frame106,125,frame126);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame106() : *
      {
         hit = 1;
      }
      
      internal function frame126() : *
      {
         stop();
      }
   }
}

