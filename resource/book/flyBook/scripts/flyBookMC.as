package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol405")]
   public dynamic class flyBookMC extends MovieClip
   {
      
      public var fowardBtn:SimpleButton;
      
      public var btn10:SimpleButton;
      
      public var btn1:SimpleButton;
      
      public var btn2:SimpleButton;
      
      public var btn3:SimpleButton;
      
      public var btn4:SimpleButton;
      
      public var btn5:SimpleButton;
      
      public var btn6:SimpleButton;
      
      public var exitBtn:SimpleButton;
      
      public var btn7:SimpleButton;
      
      public var btn8:SimpleButton;
      
      public var nextBtn:SimpleButton;
      
      public function flyBookMC()
      {
         super();
         addFrameScript(0,frame1,1,frame2,25,frame26,26,frame27);
      }
      
      public function goNext(param1:*) : *
      {
         if(currentFrame < totalFrames)
         {
            nextFrame();
         }
      }
      
      public function goFoward(param1:*) : *
      {
         if(currentFrame > 1)
         {
            prevFrame();
         }
      }
      
      public function clickHander1(param1:*) : *
      {
         gotoAndStop(3);
      }
      
      public function clickHander2(param1:*) : *
      {
         gotoAndStop(4);
      }
      
      public function clickHander3(param1:*) : *
      {
         gotoAndStop(5);
      }
      
      public function clickHander4(param1:*) : *
      {
         gotoAndStop(6);
      }
      
      public function clickHander5(param1:*) : *
      {
         gotoAndStop(6);
      }
      
      public function clickHander6(param1:*) : *
      {
         gotoAndStop(7);
      }
      
      public function clickHander7(param1:*) : *
      {
         gotoAndStop(15);
      }
      
      public function clickHander8(param1:*) : *
      {
         gotoAndStop(18);
      }
      
      public function clickHander10(param1:*) : *
      {
         gotoAndStop(6);
      }
      
      internal function frame1() : *
      {
         stop();
         nextBtn.addEventListener(MouseEvent.CLICK,goNext);
         fowardBtn.addEventListener(MouseEvent.CLICK,goFoward);
         nextBtn.visible = true;
         fowardBtn.visible = false;
      }
      
      internal function frame2() : *
      {
         nextBtn.visible = true;
         fowardBtn.visible = true;
         btn1.addEventListener(MouseEvent.CLICK,clickHander1);
         btn2.addEventListener(MouseEvent.CLICK,clickHander2);
         btn3.addEventListener(MouseEvent.CLICK,clickHander3);
         btn4.addEventListener(MouseEvent.CLICK,clickHander4);
         btn5.addEventListener(MouseEvent.CLICK,clickHander5);
         btn6.addEventListener(MouseEvent.CLICK,clickHander6);
         btn7.addEventListener(MouseEvent.CLICK,clickHander7);
         btn8.addEventListener(MouseEvent.CLICK,clickHander8);
         btn10.addEventListener(MouseEvent.CLICK,clickHander10);
      }
      
      internal function frame26() : *
      {
         nextBtn.visible = true;
         fowardBtn.visible = true;
      }
      
      internal function frame27() : *
      {
         nextBtn.visible = false;
         fowardBtn.visible = true;
      }
   }
}

