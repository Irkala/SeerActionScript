package _3751_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol358")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,139,frame140,182,frame183);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame140() : *
      {
         hit = 1;
      }
      
      internal function frame183() : *
      {
         stop();
      }
   }
}

