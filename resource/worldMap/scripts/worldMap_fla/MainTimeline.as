package worldMap_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [SWF(width="960", height="560", backgroundColor="#ffffff", frameRate="24")]
   public dynamic class MainTimeline extends MovieClip
   {
      
      public var serverNameTxt:TextField;
      
      public var closeBtn:SimpleButton;
      
      public var galaxyMC:MovieClip;
      
      public var prevBtn:SimpleButton;
      
      public var nextBtn:SimpleButton;
      
      public var backBtn:SimpleButton;
      
      public var shipBtnMC:MovieClip;
      
      public function MainTimeline()
      {
         addFrameScript(0,frame1);
         super();
      }
      
      public function closeHandler(param1:MouseEvent) : *
      {
         this.parent.removeChild(this);
      }
      
      internal function frame1() : *
      {
         closeBtn.addEventListener(MouseEvent.CLICK,closeHandler);
      }
   }
}

