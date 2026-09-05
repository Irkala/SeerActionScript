package _4515_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol455")]
   public dynamic class mc_attack_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_attack_2()
      {
         super();
         addFrameScript(0,this.frame1,77,this.frame78,136,this.frame137);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame78() : *
      {
         this.hit = 1;
      }
      
      internal function frame137() : *
      {
         stop();
      }
   }
}

