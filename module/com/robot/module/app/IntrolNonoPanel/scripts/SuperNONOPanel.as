package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1202")]
   public dynamic class SuperNONOPanel extends MovieClip
   {
      
      public var firstMC:MovieClip;
      
      public var left:MovieClip;
      
      public var closeBtn:SimpleButton;
      
      public var right:MovieClip;
      
      public function SuperNONOPanel()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         stop();
         left.addEventListener(MouseEvent.CLICK,onLeftHandler);
         right.addEventListener(MouseEvent.CLICK,onRightHandler);
      }
      
      public function onRightHandler(param1:MouseEvent) : void
      {
         if(firstMC.currentFrame < firstMC.totalFrames)
         {
            firstMC.gotoAndStop(firstMC.currentFrame + 1);
         }
      }
      
      public function onLeftHandler(param1:MouseEvent) : void
      {
         if(firstMC.currentFrame > 1)
         {
            firstMC.gotoAndStop(firstMC.currentFrame - 1);
         }
      }
   }
}

