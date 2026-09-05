package nono_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol297")]
   public dynamic class Timeline_58 extends MovieClip
   {
      
      public var cur:uint;
      
      public var nickTxt:TextField;
      
      public var masterTxt:TextField;
      
      public var txt:TextField;
      
      public var birthdayTxt:TextField;
      
      public var btn1:SimpleButton;
      
      public var btn2:SimpleButton;
      
      public var ttbgMc:MovieClip;
      
      public function Timeline_58()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         stop();
         btn1.visible = false;
         txt.text = "1 / 2";
         btn1.addEventListener(MouseEvent.CLICK,onBtn1ClickHandler);
         btn2.addEventListener(MouseEvent.CLICK,onBtn2ClickHandler);
      }
      
      public function onBtn1ClickHandler(param1:MouseEvent) : void
      {
         if(this.currentFrame > 1)
         {
            this.gotoAndStop(this.currentFrame - 1);
            btn2.visible = true;
            txt.text = "1 / 2";
            if(this.currentFrame == 1)
            {
               btn1.visible = false;
            }
         }
      }
      
      public function onBtn2ClickHandler(param1:MouseEvent) : void
      {
         if(this.currentFrame < this.totalFrames)
         {
            this.gotoAndStop(this.currentFrame + 1);
            btn1.visible = true;
            txt.text = "2 / 2";
            if(this.currentFrame == this.totalFrames)
            {
               btn2.visible = false;
            }
         }
      }
   }
}

