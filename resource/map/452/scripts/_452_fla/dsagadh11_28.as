package _452_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol113")]
   public dynamic class dsagadh11_28 extends MovieClip
   {
      
      public var doorMC:MovieClip;
      
      public var leftBTN:MovieClip;
      
      public var rightBTN:MovieClip;
      
      public var closeBTN:SimpleButton;
      
      public function dsagadh11_28()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function init() : void
      {
         leftBTN.addEventListener(MouseEvent.CLICK,leftHandler);
         rightBTN.addEventListener(MouseEvent.CLICK,rightHandler);
         closeBTN.addEventListener(MouseEvent.CLICK,closeHandler);
         leftBTN.buttonMode = rightBTN.buttonMode = true;
         leftBTN.gotoAndStop(2);
      }
      
      public function leftHandler(param1:MouseEvent) : void
      {
         if(doorMC.currentFrame == 1)
         {
            doorMC.gotoAndStop(2);
            leftBTN.gotoAndStop(2);
         }
         else if(doorMC.currentFrame == 2)
         {
            doorMC.gotoAndStop(3);
            leftBTN.gotoAndStop(1);
            rightBTN.gotoAndStop(2);
         }
      }
      
      public function rightHandler(param1:MouseEvent) : void
      {
         if(doorMC.currentFrame == 3)
         {
            doorMC.gotoAndStop(4);
            rightBTN.gotoAndStop(2);
         }
         else if(doorMC.currentFrame == 4)
         {
            doorMC.gotoAndStop(5);
            rightBTN.gotoAndStop(1);
         }
      }
      
      public function closeHandler(param1:MouseEvent) : void
      {
         this.visible = false;
      }
      
      public function destroy() : void
      {
         leftBTN.removeEventListener(MouseEvent.CLICK,leftHandler);
         rightBTN.removeEventListener(MouseEvent.CLICK,rightHandler);
         closeBTN.removeEventListener(MouseEvent.CLICK,closeHandler);
      }
      
      internal function frame1() : *
      {
         this.visible = false;
         stop();
      }
   }
}

