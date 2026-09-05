package 豹豹大师_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol214")]
   public dynamic class mc_attack_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_attack_2()
      {
         super();
         addFrameScript(0,this.frame1,52,this.frame53,78,this.frame79);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame53() : *
      {
         this.hit = 1;
      }
      
      internal function frame79() : *
      {
         stop();
      }
   }
}

