package _3666_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol127")]
   public dynamic class Timeline_35 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_35()
      {
         super();
         addFrameScript(0,this.frame1,19,this.frame20,51,this.frame52);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame20() : *
      {
         this.hit = 1;
      }
      
      internal function frame52() : *
      {
         stop();
      }
   }
}

