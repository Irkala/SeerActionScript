package beaninfo_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   [SWF(width="550", height="400", backgroundColor="#ffffff", frameRate="36")]
   public dynamic class MainTimeline extends MovieClip
   {
      
      public var next_btn:MovieClip;
      
      public var txt_mc:MovieClip;
      
      public var image_mc:MovieClip;
      
      public var close_btn:SimpleButton;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onClickHandler(param1:MouseEvent) : void
      {
         this.image_mc.gotoAndStop(2);
         this.txt_mc.gotoAndStop(2);
         this.next_btn.visible = false;
      }
      
      internal function frame1() : *
      {
         this.next_btn.addEventListener(MouseEvent.CLICK,this.onClickHandler);
      }
   }
}

