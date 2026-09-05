package _3700_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol282")]
   public dynamic class Timeline_89 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_89()
      {
         super();
         addFrameScript(0,this.frame1,9,this.frame10,47,this.frame48);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame10() : *
      {
         this.hit = 1;
      }
      
      internal function frame48() : *
      {
         stop();
      }
   }
}

