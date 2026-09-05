package ui_fla
{
   import flash.display.MovieClip;
   
   [SWF(width="959", height="560", backgroundColor="#cccccc", frameRate="24")]
   public dynamic class MainTimeline extends MovieClip
   {
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

