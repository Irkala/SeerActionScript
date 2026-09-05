package _4677_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol704")]
   public dynamic class mc_transform_136 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_transform_136()
      {
         super();
         addFrameScript(0,this.frame1,2,this.frame3,35,this.frame36);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame3() : *
      {
         this.hit = 1;
      }
      
      internal function frame36() : *
      {
         stop();
      }
   }
}

