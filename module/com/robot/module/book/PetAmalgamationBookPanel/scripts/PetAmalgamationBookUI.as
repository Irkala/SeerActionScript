package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol457")]
   public dynamic class PetAmalgamationBookUI extends MovieClip
   {
      
      public var pageTxt:TextField;
      
      public var closeBtn:SimpleButton;
      
      public var closeThisBtn:SimpleButton;
      
      public var nextBtn:SimpleButton;
      
      public var closeMc:SimpleButton;
      
      public var close_btn:SimpleButton;
      
      public var preBtn:SimpleButton;
      
      public var bgMc:MovieClip;
      
      public var itemContainer:MovieClip;
      
      public function PetAmalgamationBookUI()
      {
         super();
         addFrameScript(0,frame1,1,frame2,12,frame13);
      }
      
      internal function frame2() : *
      {
         preBtn.visible = true;
         nextBtn.visible = true;
      }
      
      internal function frame1() : *
      {
         stop();
         preBtn.visible = false;
         nextBtn.visible = true;
         preBtn.addEventListener(MouseEvent.CLICK,clickPreBtn);
         nextBtn.addEventListener(MouseEvent.CLICK,clickNextBtn);
      }
      
      internal function frame13() : *
      {
         nextBtn.visible = false;
         preBtn.visible = true;
      }
      
      public function clickPreBtn(param1:MouseEvent) : void
      {
         prevFrame();
      }
      
      public function clickNextBtn(param1:MouseEvent) : void
      {
         nextFrame();
      }
   }
}

