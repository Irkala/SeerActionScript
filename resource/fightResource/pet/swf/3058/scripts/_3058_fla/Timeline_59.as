package _3058_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol125")]
   public dynamic class Timeline_59 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_59()
      {
         super();
         addFrameScript(0,this.frame1,11,this.frame12,39,this.frame40);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame12() : *
      {
         this.hit = 1;
      }
      
      internal function frame40() : *
      {
         stop();
      }
   }
}

