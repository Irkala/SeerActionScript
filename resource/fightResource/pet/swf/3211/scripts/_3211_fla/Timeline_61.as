package _3211_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol260")]
   public dynamic class Timeline_61 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_61()
      {
         super();
         addFrameScript(0,this.frame1,49,this.frame50,87,this.frame88);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame50() : *
      {
         this.hit = 1;
      }
      
      internal function frame88() : *
      {
         stop();
      }
   }
}

