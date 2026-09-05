package _774_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol19")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,21,frame22,51,frame52);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame22() : *
      {
         hit = 1;
      }
      
      internal function frame52() : *
      {
         stop();
      }
   }
}

