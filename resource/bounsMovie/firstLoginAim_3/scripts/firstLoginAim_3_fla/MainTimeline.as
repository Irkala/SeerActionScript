package firstLoginAim_3_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   [SWF(width="960", height="560", backgroundColor="#000000", frameRate="25")]
   public dynamic class MainTimeline extends MovieClip
   {
      
      public var endBtn:SimpleButton;
      
      public var sureBtn:SimpleButton;
      
      public var returnBtn:SimpleButton;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,frame1,1,frame2,5,frame6);
      }
      
      internal function frame1() : *
      {
         stop();
         sureBtn.addEventListener(MouseEvent.CLICK,onSureHandler);
      }
      
      internal function frame2() : *
      {
         returnBtn.addEventListener(MouseEvent.CLICK,onReturnHandler);
      }
      
      internal function frame6() : *
      {
         stop();
         endBtn.addEventListener(MouseEvent.CLICK,onEndClickHandler);
      }
      
      public function onSureHandler(param1:MouseEvent) : void
      {
         nextFrame();
      }
      
      public function onReturnHandler(param1:MouseEvent) : void
      {
         prevFrame();
      }
      
      public function onEndClickHandler(param1:MouseEvent) : void
      {
         this.dispatchEvent(new Event(Event.CLOSE));
      }
   }
}

