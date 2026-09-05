package timeNews_fla
{
   import adobe.utils.*;
   import flash.accessibility.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.sampler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol826")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var b_03:MovieClip;
      
      public var b_04:MovieClip;
      
      public var btnint1:uint;
      
      public var addParty0:SimpleButton;
      
      public var addParty1:SimpleButton;
      
      public var addParty5:SimpleButton;
      
      public var mailBox1:SimpleButton;
      
      public var mailBox4:SimpleButton;
      
      public var chooseNum1:uint;
      
      public var addParty12:MovieClip;
      
      public var dui_mc:MovieClip;
      
      public var btn1:SimpleButton;
      
      public var btn2:SimpleButton;
      
      public var fowardBtn:SimpleButton;
      
      public var btn4:SimpleButton;
      
      public var btn3:SimpleButton;
      
      public var nextBtn:SimpleButton;
      
      public var confirmBtn:MovieClip;
      
      public var firstPageBtn:SimpleButton;
      
      public var b_01:MovieClip;
      
      public var b_02:MovieClip;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3,3,frame4,4,frame5,5,frame6,6,frame7,7,frame8,8,frame9,9,frame10,10,frame11,11,frame12,12,frame13,13,frame14,14,frame15,15,frame16,16,frame17);
      }
      
      public function clickHandlerChoose1(param1:MouseEvent) : void
      {
         var _loc2_:String = param1.currentTarget.name;
         var _loc3_:uint = uint(_loc2_.substr(3,1));
         var _loc4_:MovieClip = this["b_0" + _loc3_] as MovieClip;
         dui_mc.visible = true;
         dui_mc.x = _loc4_.x;
         dui_mc.y = _loc4_.y;
         chooseNum1 = _loc3_;
      }
      
      public function goFirst(param1:*) : *
      {
         gotoAndStop(1);
      }
      
      public function onGotoMole12(param1:*) : void
      {
         var _loc2_:String = "http://pay.61.com/account/service";
         var _loc3_:URLRequest = new URLRequest(_loc2_);
         navigateToURL(_loc3_);
      }
      
      public function clickHander1(param1:*) : *
      {
         gotoAndStop(2);
      }
      
      public function clickHander2(param1:*) : *
      {
         gotoAndStop(3);
      }
      
      public function clickHander3(param1:*) : *
      {
         gotoAndStop(7);
      }
      
      public function onGotoMole0(param1:*) : void
      {
         var _loc2_:String = "http://pay.61.com/saler/defaultSalers?game=seer";
         var _loc3_:URLRequest = new URLRequest(_loc2_);
         navigateToURL(_loc3_);
      }
      
      public function onGotoMole1(param1:*) : void
      {
         var _loc2_:String = "http://pay.61.com/mmcard/dontBuyMmcard";
         var _loc3_:URLRequest = new URLRequest(_loc2_);
         navigateToURL(_loc3_);
      }
      
      public function clickHander4(param1:*) : *
      {
         gotoAndStop(4);
      }
      
      public function onGotoMole5(param1:*) : void
      {
         var _loc2_:String = "http://www.51mole.com";
         var _loc3_:URLRequest = new URLRequest(_loc2_);
         navigateToURL(_loc3_);
      }
      
      public function goFoward(param1:*) : *
      {
         if(currentFrame > 1)
         {
            prevFrame();
         }
      }
      
      internal function frame12() : *
      {
         fowardBtn.visible = true;
         nextBtn.visible = true;
         mailBox1.addEventListener(MouseEvent.CLICK,showBox1);
      }
      
      internal function frame13() : *
      {
         fowardBtn.visible = true;
         nextBtn.visible = true;
      }
      
      internal function frame14() : *
      {
         fowardBtn.visible = true;
         nextBtn.visible = true;
      }
      
      internal function frame15() : *
      {
         fowardBtn.visible = true;
         nextBtn.visible = true;
      }
      
      internal function frame10() : *
      {
         fowardBtn.visible = true;
         nextBtn.visible = true;
      }
      
      internal function frame11() : *
      {
         fowardBtn.visible = true;
         nextBtn.visible = true;
      }
      
      internal function frame16() : *
      {
         fowardBtn.visible = true;
         nextBtn.visible = true;
         fowardBtn.visible = true;
         nextBtn.visible = true;
         addParty5.addEventListener(MouseEvent.CLICK,onGotoMole5);
      }
      
      internal function frame17() : *
      {
         fowardBtn.visible = true;
         nextBtn.visible = false;
      }
      
      internal function frame6() : *
      {
         fowardBtn.visible = true;
         nextBtn.visible = true;
      }
      
      public function showBox1(param1:*) : *
      {
         var _loc2_:* = getDefinitionByName("com.robot.app.newspaper.ContributeAlert");
         _loc2_.show(1);
      }
      
      internal function frame1() : *
      {
         stop();
         nextBtn.addEventListener(MouseEvent.CLICK,goNext);
         fowardBtn.addEventListener(MouseEvent.CLICK,goFoward);
         firstPageBtn.addEventListener(MouseEvent.CLICK,goFirst);
         fowardBtn.visible = false;
         nextBtn.visible = true;
         btn1.addEventListener(MouseEvent.CLICK,clickHander1);
         btn2.addEventListener(MouseEvent.CLICK,clickHander2);
         btn3.addEventListener(MouseEvent.CLICK,clickHander3);
         btn4.addEventListener(MouseEvent.CLICK,clickHander4);
      }
      
      internal function frame2() : *
      {
         fowardBtn.visible = true;
         nextBtn.visible = true;
      }
      
      public function showBox4(param1:*) : *
      {
         var _loc2_:* = getDefinitionByName("com.robot.app.newspaper.ContributeAlert");
         _loc2_.show(4);
      }
      
      internal function frame4() : *
      {
         fowardBtn.visible = true;
         nextBtn.visible = true;
      }
      
      internal function frame5() : *
      {
         fowardBtn.visible = true;
         nextBtn.visible = true;
      }
      
      internal function frame7() : *
      {
         fowardBtn.visible = true;
         nextBtn.visible = true;
      }
      
      internal function frame8() : *
      {
         fowardBtn.visible = true;
         nextBtn.visible = true;
         addParty1.addEventListener(MouseEvent.CLICK,onGotoMole1);
         addParty0.addEventListener(MouseEvent.CLICK,onGotoMole0);
      }
      
      internal function frame9() : *
      {
         fowardBtn.visible = true;
         nextBtn.visible = true;
         dui_mc.visible = false;
         btnint1 = 1;
         while(btnint1 < 5)
         {
            this["b_0" + btnint1].addEventListener(MouseEvent.CLICK,clickHandlerChoose1);
            this["b_0" + btnint1].buttonMode = true;
            ++btnint1;
         }
         confirmBtn.addEventListener(MouseEvent.CLICK,onConfirm1);
         addParty12.addEventListener(MouseEvent.CLICK,onGotoMole12);
         mailBox4.addEventListener(MouseEvent.CLICK,showBox4);
      }
      
      internal function frame3() : *
      {
         fowardBtn.visible = true;
         nextBtn.visible = true;
      }
      
      public function onConfirm1(param1:*) : void
      {
         if(chooseNum1 == 0)
         {
            return;
         }
         var _loc2_:* = getDefinitionByName("com.robot.app.vote.VoteManager");
         _loc2_.vote(26,[chooseNum1],1001);
         trace(chooseNum1);
      }
      
      public function goNext(param1:*) : *
      {
         if(currentFrame < totalFrames)
         {
            nextFrame();
         }
      }
   }
}

