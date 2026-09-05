package _2546_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol152")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,106,frame107,139,frame140);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame107() : *
      {
         hit = 1;
      }
      
      internal function frame140() : *
      {
         stop();
      }
   }
}

