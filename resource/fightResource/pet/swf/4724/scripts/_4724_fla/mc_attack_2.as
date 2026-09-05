package _4724_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol81")]
   public dynamic class mc_attack_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_attack_2()
      {
         super();
         addFrameScript(0,this.frame1,39,this.frame40,66,this.frame67);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame40() : *
      {
         this.hit = 1;
      }
      
      internal function frame67() : *
      {
         stop();
      }
   }
}

