package _fla
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1191")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var secondMC:MovieClip;
      
      public var goMapBtn_1:SimpleButton;
      
      public var goMapBtn_2:SimpleButton;
      
      public var goMapBtn_3:SimpleButton;
      
      public var goMapBtn_4:SimpleButton;
      
      public var goMapBtn_5:SimpleButton;
      
      public var goMapBtn_6:SimpleButton;
      
      public var goMapBtn_7:SimpleButton;
      
      public var goMapBtn_8:SimpleButton;
      
      public var goMapBtn_9:SimpleButton;
      
      public var left_btn:SimpleButton;
      
      public var cls:Object;
      
      public var cls_10:*;
      
      public var btn1:SimpleButton;
      
      public var goMapBtn_10:SimpleButton;
      
      public var goMapBtn_11:SimpleButton;
      
      public var goMapBtn_12:SimpleButton;
      
      public var goMapBtn_13:SimpleButton;
      
      public var goMapBtn_14:SimpleButton;
      
      public var goMapBtn_15:SimpleButton;
      
      public var btn2:SimpleButton;
      
      public var btn3:SimpleButton;
      
      public var btn4:SimpleButton;
      
      public var cls_5:*;
      
      public var pageTxt:TextField;
      
      public var cls_7:*;
      
      public var cls_1:*;
      
      public var cls_9:*;
      
      public var cls_3:*;
      
      public var cls_4:*;
      
      public var cls_14:*;
      
      public var cls_6:*;
      
      public var cls_8:*;
      
      public var cls_2:*;
      
      public var cls_11:*;
      
      public var cls_13:*;
      
      public var cls_15:*;
      
      public var cls_12:*;
      
      public var closeMc:SimpleButton;
      
      public var bgMc:MovieClip;
      
      public var right_btn:SimpleButton;
      
      public var closeThisBtn:SimpleButton;
      
      public var index:uint;
      
      public var list_mc:MovieClip;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3,3,frame4,4,frame5,5,frame6,6,frame7,7,frame8,8,frame9,9,frame10,10,frame11,11,frame12,12,frame13,13,frame14,14,frame15,15,frame16,16,frame17);
      }
      
      public function onClick12Handler(param1:MouseEvent) : *
      {
         cls_12.changeMap(cls.actorID);
      }
      
      public function onClick6Handler(param1:MouseEvent) : *
      {
         cls_6.changeMap(8);
      }
      
      public function onClick11Handler(param1:MouseEvent) : *
      {
         cls_11.changeMap(107);
      }
      
      public function onClick5Handler(param1:MouseEvent) : *
      {
         cls_5.changeMap(107);
      }
      
      internal function frame10() : *
      {
         stop();
         try
         {
            cls_9 = getDefinitionByName("com.robot.core.manager.MapManager");
            goMapBtn_9.addEventListener(MouseEvent.CLICK,onClick9Handler);
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame11() : *
      {
         stop();
         try
         {
            cls_10 = getDefinitionByName("com.robot.core.manager.MapManager");
            goMapBtn_10.addEventListener(MouseEvent.CLICK,onClick10Handler);
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame12() : *
      {
         stop();
         try
         {
            cls_11 = getDefinitionByName("com.robot.core.manager.MapManager");
            goMapBtn_11.addEventListener(MouseEvent.CLICK,onClick11Handler);
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame13() : *
      {
         stop();
         try
         {
            cls_12 = getDefinitionByName("com.robot.core.manager.MapManager");
            cls = getDefinitionByName("com.robot.core.manager.MainManager");
            goMapBtn_12.addEventListener(MouseEvent.CLICK,onClick12Handler);
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame14() : *
      {
         stop();
         try
         {
            cls_13 = getDefinitionByName("com.robot.core.manager.MapManager");
            goMapBtn_13.addEventListener(MouseEvent.CLICK,onClick13Handler);
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame15() : *
      {
         stop();
         try
         {
            cls_14 = getDefinitionByName("com.robot.core.manager.MapManager");
            goMapBtn_14.addEventListener(MouseEvent.CLICK,onClick14Handler);
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame16() : *
      {
         stop();
         try
         {
            cls_15 = getDefinitionByName("com.robot.core.manager.MapManager");
            goMapBtn_15.addEventListener(MouseEvent.CLICK,onClick15Handler);
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame17() : *
      {
         stop();
         index = 1;
         left_btn.addEventListener(MouseEvent.CLICK,onLeftBtnClickHandler);
         right_btn.addEventListener(MouseEvent.CLICK,onRightBtnClickHandler);
         list_mc["goPageFunc"] = goPage;
      }
      
      public function onClick10Handler(param1:MouseEvent) : *
      {
         cls_10.changeMap(102);
      }
      
      internal function frame1() : *
      {
         stop();
         this["btn1"].addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            gotoAndStop(2);
         });
         this["btn2"].addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            gotoAndStop(3);
         });
         this["btn3"].addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            gotoAndStop(4);
         });
         this["btn4"].addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            gotoAndStop(5);
         });
      }
      
      public function onClick4Handler(param1:MouseEvent) : *
      {
         cls_4.changeMap(107);
      }
      
      internal function frame6() : *
      {
         stop();
         try
         {
            cls_5 = getDefinitionByName("com.robot.core.manager.MapManager");
            goMapBtn_5.addEventListener(MouseEvent.CLICK,onClick5Handler);
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame9() : *
      {
         stop();
         try
         {
            cls_8 = getDefinitionByName("com.robot.core.manager.MapManager");
            goMapBtn_8.addEventListener(MouseEvent.CLICK,onClick8Handler);
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame2() : *
      {
         stop();
         try
         {
            cls_1 = getDefinitionByName("com.robot.core.manager.MapManager");
            goMapBtn_1.addEventListener(MouseEvent.CLICK,onClick1Handler);
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame3() : *
      {
         stop();
         try
         {
            cls_2 = getDefinitionByName("com.robot.core.manager.MapManager");
            goMapBtn_2.addEventListener(MouseEvent.CLICK,onClick2Handler);
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame5() : *
      {
         stop();
         try
         {
            cls_4 = getDefinitionByName("com.robot.core.manager.MapManager");
            goMapBtn_4.addEventListener(MouseEvent.CLICK,onClick4Handler);
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame7() : *
      {
         stop();
         try
         {
            cls_6 = getDefinitionByName("com.robot.core.manager.MapManager");
            goMapBtn_6.addEventListener(MouseEvent.CLICK,onClick6Handler);
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame8() : *
      {
         stop();
         try
         {
            cls_7 = getDefinitionByName("com.robot.core.manager.MapManager");
            goMapBtn_7.addEventListener(MouseEvent.CLICK,onClick7Handler);
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame4() : *
      {
         stop();
         try
         {
            cls_3 = getDefinitionByName("com.robot.core.manager.MapManager");
            goMapBtn_3.addEventListener(MouseEvent.CLICK,onClick3Handler);
         }
         catch(e:Error)
         {
         }
      }
      
      public function onClick3Handler(param1:MouseEvent) : *
      {
         cls_3.changeMap(61);
      }
      
      public function goPage(param1:uint) : void
      {
         secondMC.gotoAndStop(param1);
      }
      
      public function onClick2Handler(param1:MouseEvent) : *
      {
         cls_2.changeMap(61);
      }
      
      public function onClick15Handler(param1:MouseEvent) : *
      {
         cls_15.changeMap(107);
      }
      
      public function onClick9Handler(param1:MouseEvent) : *
      {
         cls_9.changeMap(57);
      }
      
      public function onClick1Handler(param1:MouseEvent) : *
      {
         cls_1.changeMap(61);
      }
      
      public function onLeftBtnClickHandler(param1:MouseEvent) : void
      {
         index = list_mc.currentFrame;
         if(index <= 1)
         {
            index = list_mc.totalFrames;
         }
         else
         {
            --index;
         }
         list_mc.gotoAndStop(index);
      }
      
      public function onClick14Handler(param1:MouseEvent) : *
      {
         cls_14.changeMap(8);
      }
      
      public function onRightBtnClickHandler(param1:MouseEvent) : void
      {
         index = list_mc.currentFrame;
         if(index >= list_mc.totalFrames)
         {
            index = 0;
         }
         else
         {
            ++index;
         }
         list_mc.gotoAndStop(index);
      }
      
      public function onClick8Handler(param1:MouseEvent) : *
      {
         cls_8.changeMap(57);
      }
      
      public function onClick7Handler(param1:MouseEvent) : *
      {
         cls_7.changeMap(57);
      }
      
      public function onClick13Handler(param1:MouseEvent) : *
      {
         cls_13.changeMap(107);
      }
   }
}

