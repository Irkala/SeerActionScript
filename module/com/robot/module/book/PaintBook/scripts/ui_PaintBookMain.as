package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol223")]
   public dynamic class ui_PaintBookMain extends MovieClip
   {
      
      public var closeBtn:SimpleButton;
      
      public var nextBtn:SimpleButton;
      
      public var prevBtn:SimpleButton;
      
      public function ui_PaintBookMain()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,12,this.frame13,13,this.frame14);
      }
      
      internal function frame2() : *
      {
         this.prevBtn.visible = true;
         this.nextBtn.visible = true;
      }
      
      internal function frame1() : *
      {
         stop();
         this.prevBtn.visible = false;
         this.nextBtn.visible = true;
         this.prevBtn.addEventListener(MouseEvent.CLICK,this.prevHandler);
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.nextHandler);
      }
      
      internal function frame13() : *
      {
         this.prevBtn.visible = true;
         this.nextBtn.visible = true;
      }
      
      public function prevHandler(param1:*) : *
      {
         prevFrame();
      }
      
      public function nextHandler(param1:*) : *
      {
         nextFrame();
      }
      
      internal function frame14() : *
      {
         this.nextBtn.visible = false;
         this.prevBtn.visible = true;
      }
   }
}

