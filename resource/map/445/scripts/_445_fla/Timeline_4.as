package _445_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol83")]
   public dynamic class Timeline_4 extends MovieClip
   {
      
      public function Timeline_4()
      {
         super();
         addFrameScript(0,this.frame1,19,this.frame20);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame20() : *
      {
         gotoAndPlay(2);
      }
   }
}

