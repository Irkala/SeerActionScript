package _fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol866")]
   public dynamic class Timeline_158 extends MovieClip
   {
      
      public var preBtn:SimpleButton;
      
      public var nextBtn:SimpleButton;
      
      public var curPage:uint;
      
      public var txt:TextField;
      
      public var totalPage:uint;
      
      public function Timeline_158()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         this.gotoAndStop(1);
         totalPage = 6;
         curPage = 1;
         txt.text = curPage.toString() + "/" + totalPage.toString();
         preBtn.addEventListener(MouseEvent.CLICK,onPreBtnClickHandler);
         nextBtn.addEventListener(MouseEvent.CLICK,onNextBtnClickHandler);
      }
      
      public function onNextBtnClickHandler(param1:MouseEvent) : void
      {
         if(curPage < totalPage)
         {
            ++curPage;
            this.gotoAndStop(curPage);
            txt.text = curPage.toString() + "/" + totalPage.toString();
         }
      }
      
      public function onPreBtnClickHandler(param1:MouseEvent) : void
      {
         if(curPage > 1)
         {
            --curPage;
            this.gotoAndStop(curPage);
            txt.text = curPage.toString() + "/" + totalPage.toString();
         }
      }
   }
}

