package _73_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol340")]
   public dynamic class Timeline_18 extends MovieClip
   {
      
      public var mc1:MovieClip;
      
      public var mc2:MovieClip;
      
      public function Timeline_18()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         stop();
      }
   }
}

