package task_122_1_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [SWF(width="960", height="560", backgroundColor="#ffffff", frameRate="25")]
   public dynamic class MainTimeline extends MovieClip
   {
      
      public var top_mc:MovieClip;
      
      public var close_btn:SimpleButton;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

