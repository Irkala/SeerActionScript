package _1400671_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol814")]
   public dynamic class mc_appear_263 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_appear_263()
      {
         super();
         addFrameScript(0,this.frame1,2,this.frame3,40,this.frame41);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame3() : *
      {
         this.hit = 1;
      }
      
      internal function frame41() : *
      {
         stop();
      }
   }
}

