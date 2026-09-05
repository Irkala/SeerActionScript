package _006_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol36")]
   public dynamic class Timeline_11 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_11()
      {
         super();
         addFrameScript(0,frame1,15,frame16,51,frame52);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame16() : *
      {
         hit = 1;
      }
      
      internal function frame52() : *
      {
         stop();
      }
   }
}

