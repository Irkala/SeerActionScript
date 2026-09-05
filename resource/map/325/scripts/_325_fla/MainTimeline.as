package _325_fla
{
   import flash.display.MovieClip;
   
   [SWF(width="960", height="560", backgroundColor="#ffffff", frameRate="24")]
   public dynamic class MainTimeline extends MovieClip
   {
      
      public var depth_mc:MovieClip;
      
      public var animator_mc:MovieClip;
      
      public var control_mc:MovieClip;
      
      public var buttonLevel:MovieClip;
      
      public var type_mc:MovieClip;
      
      public var top_mc:MovieClip;
      
      public var bg_mc:MovieClip;
      
      public function MainTimeline()
      {
         addFrameScript(0,this.frame1);
         super();
      }
      
      internal function frame1() : *
      {
         this.type_mc.mouseChildren = false;
         this.type_mc.mouseEnabled = false;
      }
   }
}

