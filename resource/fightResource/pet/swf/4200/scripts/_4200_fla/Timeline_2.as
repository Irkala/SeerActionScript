package _4200_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol236")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,125,frame126,153,frame154);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame126() : *
      {
         hit = 1;
      }
      
      internal function frame154() : *
      {
         stop();
      }
   }
}

