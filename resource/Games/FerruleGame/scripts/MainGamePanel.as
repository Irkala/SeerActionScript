package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol309")]
   public dynamic class MainGamePanel extends MovieClip
   {
      
      public var close_btn1:SimpleButton;
      
      public var bg:MovieClip;
      
      public var close_btn5:SimpleButton;
      
      public var bg1:MovieClip;
      
      public var bg2:MovieClip;
      
      public var balake:MovieClip;
      
      public var seer1:MovieClip;
      
      public var seer2:MovieClip;
      
      public var commit_btn:SimpleButton;
      
      public var close_btn:SimpleButton;
      
      public var start_btn1:SimpleButton;
      
      public var tip:MovieClip;
      
      public var help_btn:SimpleButton;
      
      public var seer3:MovieClip;
      
      public var milu:MovieClip;
      
      public var txt:TextField;
      
      public var start_btn:SimpleButton;
      
      public function MainGamePanel()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3,3,frame4);
      }
      
      public function onHelpClickHandler(param1:MouseEvent) : void
      {
         gotoAndStop(3);
      }
      
      public function onCloseClickHandler(param1:MouseEvent) : void
      {
         trace(this.name);
         this.dispatchEvent(new Event("CLOSEGAME"));
      }
      
      internal function frame4() : *
      {
         stop();
         commit_btn.addEventListener(MouseEvent.CLICK,function():void
         {
            dispatchEvent(new Event("CLOSENAME2"));
         });
      }
      
      internal function frame2() : *
      {
         stop();
      }
      
      internal function frame3() : *
      {
         stop();
         start_btn1.addEventListener(MouseEvent.CLICK,function():void
         {
            dispatchEvent(new Event("BEGAINAME"));
         });
         close_btn5.addEventListener(MouseEvent.CLICK,function():void
         {
            dispatchEvent(new Event("CLOSENAME1"));
         });
      }
      
      internal function frame1() : *
      {
         stop();
         help_btn.addEventListener(MouseEvent.CLICK,onHelpClickHandler);
         close_btn.addEventListener(MouseEvent.CLICK,onCloseClickHandler);
      }
   }
}

