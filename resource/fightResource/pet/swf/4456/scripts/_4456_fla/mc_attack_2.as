package _4456_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol200")]
   public dynamic class mc_attack_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_attack_2()
      {
         super();
         addFrameScript(0,this.frame1,95,this.frame96,126,this.frame127);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame96() : *
      {
         this.hit = 1;
      }
      
      internal function frame127() : *
      {
         stop();
      }
   }
}

