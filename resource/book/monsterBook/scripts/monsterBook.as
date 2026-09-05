package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol617")]
   public dynamic class monsterBook extends MovieClip
   {
      
      public var nextBtn:SimpleButton;
      
      public var closeBtn:SimpleButton;
      
      public var cureBtn:SimpleButton;
      
      public var fowardBtn:SimpleButton;
      
      public function monsterBook()
      {
         super();
         addFrameScript(0,frame1,1,frame2,18,frame19,19,frame20);
      }
      
      internal function frame1() : *
      {
         stop();
         nextBtn.addEventListener(MouseEvent.CLICK,goNext);
         fowardBtn.addEventListener(MouseEvent.CLICK,goFoward);
         fowardBtn.visible = false;
         nextBtn.visible = true;
      }
      
      internal function frame2() : *
      {
         fowardBtn.visible = true;
         nextBtn.visible = true;
      }
      
      public function goFoward(param1:*) : *
      {
         if(currentFrame > 1)
         {
            prevFrame();
         }
         else
         {
            gotoAndStop(totalFrames);
         }
      }
      
      internal function frame20() : *
      {
         fowardBtn.visible = true;
         nextBtn.visible = false;
      }
      
      public function goNext(param1:*) : *
      {
         if(currentFrame < totalFrames)
         {
            nextFrame();
         }
         else if(currentFrame == totalFrames)
         {
            gotoAndStop(1);
         }
      }
      
      internal function frame19() : *
      {
         fowardBtn.visible = true;
         nextBtn.visible = true;
      }
   }
}

