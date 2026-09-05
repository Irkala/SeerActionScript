package _1984_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol23")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,40,frame41,73,frame74);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame41() : *
      {
         hit = 1;
      }
      
      internal function frame74() : *
      {
         stop();
      }
   }
}

