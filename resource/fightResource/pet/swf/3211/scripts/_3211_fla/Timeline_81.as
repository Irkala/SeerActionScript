package _3211_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol278")]
   public dynamic class Timeline_81 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_81()
      {
         super();
         addFrameScript(0,this.frame1,29,this.frame30,69,this.frame70);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame30() : *
      {
         this.hit = 1;
      }
      
      internal function frame70() : *
      {
         stop();
      }
   }
}

