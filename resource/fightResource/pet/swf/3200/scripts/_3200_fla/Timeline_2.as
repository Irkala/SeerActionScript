package _3200_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol127")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,this.frame1,124,this.frame125,158,this.frame159);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame125() : *
      {
         this.hit = 1;
      }
      
      internal function frame159() : *
      {
         stop();
      }
   }
}

