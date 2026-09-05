package _454_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol280")]
   public dynamic class Timeline_107 extends MovieClip
   {
      
      public function Timeline_107()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         stop();
         this.parent.visible = false;
      }
   }
}

