package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol889")]
   public dynamic class SuperNONOJianJie_Mc extends MovieClip
   {
      
      public var closeBtn:SimpleButton;
      
      public var btn_0:MovieClip;
      
      public var btn_1:MovieClip;
      
      public var btn_2:MovieClip;
      
      public var next_btn:SimpleButton;
      
      public var btn1:SimpleButton;
      
      public var prev_btn:SimpleButton;
      
      public var bookLinkBtn:SimpleButton;
      
      public var si_mc:MovieClip;
      
      public var addPartyBtn:SimpleButton;
      
      public var btn_3:MovieClip;
      
      public var nono_btn:SimpleButton;
      
      public var addPartyBtn1:SimpleButton;
      
      public function SuperNONOJianJie_Mc()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,2,this.frame3,3,this.frame4,4,this.frame5,5,this.frame6,6,this.frame7,7,this.frame8,8,this.frame9,9,this.frame10);
      }
      
      internal function frame5() : *
      {
         this.prev_btn.visible = false;
         this.next_btn.visible = false;
      }
      
      internal function frame8() : *
      {
         this.prev_btn.visible = true;
         this.next_btn.visible = true;
      }
      
      public function visibleBtn() : void
      {
         this.prev_btn.visible = false;
         this.next_btn.visible = false;
      }
      
      public function clickBtn3Handler(param1:MouseEvent) : void
      {
         this.btn_3.gotoAndStop(2);
         this.btn_0.gotoAndStop(1);
         this.btn_1.gotoAndStop(1);
         this.btn_2.gotoAndStop(1);
         gotoAndStop(7);
      }
      
      internal function frame10() : *
      {
         this.prev_btn.visible = true;
         this.next_btn.visible = false;
      }
      
      public function nonoClickHandler(param1:MouseEvent) : void
      {
      }
      
      public function clickBtn1Handler(param1:MouseEvent) : void
      {
         this.btn_0.gotoAndStop(1);
         this.btn_1.gotoAndStop(2);
         this.btn_2.gotoAndStop(1);
         this.btn_3.gotoAndStop(1);
         gotoAndStop(5);
         this.visibleBtn();
      }
      
      public function onGotoMole(param1:*) : void
      {
         var _loc2_:String = "http://pay.51mole.com/index.php?m=nono";
         var _loc3_:URLRequest = new URLRequest(_loc2_);
         navigateToURL(_loc3_);
      }
      
      internal function frame1() : *
      {
         stop();
         this.btn_0.gotoAndStop(2);
         this.btn_1.gotoAndStop(1);
         this.btn_2.gotoAndStop(1);
         this.btn_0.buttonMode = true;
         this.btn_1.buttonMode = true;
         this.btn_2.buttonMode = true;
         this.btn_3.buttonMode = true;
         this.prev_btn.visible = false;
         this.next_btn.addEventListener(MouseEvent.CLICK,this.nextClickHandler);
         this.prev_btn.addEventListener(MouseEvent.CLICK,this.prevClickHandler);
         this.btn_0.addEventListener(MouseEvent.CLICK,this.clickBtn0Handler);
         this.btn_1.addEventListener(MouseEvent.CLICK,this.clickBtn1Handler);
         this.btn_2.addEventListener(MouseEvent.CLICK,this.clickBtn2Handler);
         this.btn_3.addEventListener(MouseEvent.CLICK,this.clickBtn3Handler);
         this.bookLinkBtn.addEventListener(MouseEvent.CLICK,this.bookClickHandler);
         this.nono_btn.addEventListener(MouseEvent.CLICK,this.nonoClickHandler);
         this.bookLinkBtn.addEventListener(MouseEvent.CLICK,this.onClickHandler1);
         this.nono_btn.addEventListener(MouseEvent.CLICK,this.onClickHandler2);
      }
      
      internal function frame2() : *
      {
         this.prev_btn.visible = true;
         this.next_btn.visible = true;
      }
      
      internal function frame6() : *
      {
         this.addPartyBtn1.addEventListener(MouseEvent.CLICK,this.onGotoMole);
         this.addPartyBtn.addEventListener(MouseEvent.CLICK,this.onGotoMole);
         this.prev_btn.visible = false;
         this.next_btn.visible = false;
      }
      
      public function bookClickHandler(param1:MouseEvent) : void
      {
      }
      
      public function clickBtn2Handler(param1:MouseEvent) : void
      {
         this.btn_0.gotoAndStop(1);
         this.btn_1.gotoAndStop(1);
         this.btn_3.gotoAndStop(1);
         this.btn_2.gotoAndStop(2);
         gotoAndStop(6);
         this.visibleBtn();
      }
      
      internal function frame3() : *
      {
         this.prev_btn.visible = true;
         this.next_btn.visible = true;
      }
      
      public function onClickHandler1(param1:MouseEvent) : void
      {
         this.dispatchEvent(new Event(Event.OPEN));
      }
      
      public function onClickHandler2(param1:MouseEvent) : void
      {
         this.dispatchEvent(new Event("nonobookchange"));
      }
      
      internal function frame9() : *
      {
         this.prev_btn.visible = true;
         this.next_btn.visible = true;
      }
      
      public function nextClickHandler(param1:MouseEvent) : void
      {
         nextFrame();
      }
      
      internal function frame4() : *
      {
         this.prev_btn.visible = true;
         this.next_btn.visible = false;
      }
      
      internal function frame7() : *
      {
         this.prev_btn.visible = false;
         this.next_btn.visible = true;
      }
      
      public function prevClickHandler(param1:MouseEvent) : void
      {
         prevFrame();
      }
      
      public function clickBtn0Handler(param1:MouseEvent) : void
      {
         this.btn_0.gotoAndStop(2);
         this.btn_1.gotoAndStop(1);
         this.btn_2.gotoAndStop(1);
         this.btn_3.gotoAndStop(1);
         gotoAndStop(1);
         this.prev_btn.visible = false;
         this.next_btn.visible = true;
      }
   }
}

