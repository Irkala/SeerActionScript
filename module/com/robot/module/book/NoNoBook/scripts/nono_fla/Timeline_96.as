package nono_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol358")]
   public dynamic class Timeline_96 extends MovieClip
   {
      
      public var txt:TextField;
      
      public var btn1:SimpleButton;
      
      public var btn2:SimpleButton;
      
      public var btn:SimpleButton;
      
      public function Timeline_96()
      {
         super();
         addFrameScript(0,frame1,2,frame3);
      }
      
      public function onClickHandler(param1:MouseEvent) : void
      {
         this.parent.dispatchEvent(new Event(Event.OPEN));
      }
      
      internal function frame1() : *
      {
         stop();
         txt.text = "1 / 3";
         btn1.visible = false;
         btn1.addEventListener(MouseEvent.CLICK,onBtn1ClickHandler);
         btn2.addEventListener(MouseEvent.CLICK,onBtn2ClickHandler);
      }
      
      internal function frame3() : *
      {
         btn.addEventListener(MouseEvent.CLICK,onClickHandler);
      }
      
      public function onBtn2ClickHandler(param1:MouseEvent) : void
      {
         if(this.currentFrame < this.totalFrames)
         {
            this.gotoAndStop(this.currentFrame + 1);
            btn1.visible = true;
            txt.text = this.currentFrame + " / 3";
            if(this.currentFrame == this.totalFrames)
            {
               btn2.visible = false;
            }
         }
      }
      
      public function onBtn1ClickHandler(param1:MouseEvent) : void
      {
         if(this.currentFrame > 1)
         {
            this.gotoAndStop(this.currentFrame - 1);
            btn2.visible = true;
            txt.text = this.currentFrame + " / 3";
            if(this.currentFrame == 1)
            {
               btn1.visible = false;
            }
         }
      }
   }
}

