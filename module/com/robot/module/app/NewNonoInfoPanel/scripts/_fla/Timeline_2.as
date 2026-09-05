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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1201")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var goMapBtn_map_8:SimpleButton;
      
      public var secondMC:MovieClip;
      
      public var goMapBtn_0:SimpleButton;
      
      public var goMapBtn_2:SimpleButton;
      
      public var goMapBtn_3:SimpleButton;
      
      public var goMapBtn_4:SimpleButton;
      
      public var goMapBtn_8:SimpleButton;
      
      public var left_btn:SimpleButton;
      
      public var goMapBtn_1:SimpleButton;
      
      public var cls:Object;
      
      public var closeMc:SimpleButton;
      
      public var bgMc:MovieClip;
      
      public var cls_map_8:*;
      
      public var closeThisBtn:SimpleButton;
      
      public var cls_59_0:*;
      
      public var cls_59_1:*;
      
      public var goMapBtn_59_0:SimpleButton;
      
      public var goMapBtn_59_1:SimpleButton;
      
      public var right_btn:SimpleButton;
      
      public var index:uint;
      
      public var btn1:SimpleButton;
      
      public var btn2:SimpleButton;
      
      public var btn3:SimpleButton;
      
      public var btn4:SimpleButton;
      
      public var cls_59:*;
      
      public var goMapBtn_59:SimpleButton;
      
      public var cls_2:*;
      
      public var list_mc:MovieClip;
      
      public var cls_4:*;
      
      public var pageTxt:TextField;
      
      public var cls_0:*;
      
      public var cls_3:*;
      
      public var cls_8:*;
      
      public var cls_1:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3,3,frame4,4,frame5,5,frame6,6,frame7,7,frame8,8,frame9,9,frame10,10,frame11,11,frame12);
      }
      
      internal function frame11() : *
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
      
      public function onClick3Handler(param1:MouseEvent) : *
      {
         cls_3.changeMap(107);
      }
      
      public function onClick59_1Handler(param1:MouseEvent) : *
      {
         cls_59_1.changeMap(57);
      }
      
      public function goPage(param1:uint) : void
      {
         secondMC.gotoAndStop(param1);
      }
      
      internal function frame12() : *
      {
         stop();
         index = 1;
         left_btn.addEventListener(MouseEvent.CLICK,onLeftBtnClickHandler);
         right_btn.addEventListener(MouseEvent.CLICK,onRightBtnClickHandler);
         list_mc["goPageFunc"] = goPage;
      }
      
      public function onClick2Handler(param1:MouseEvent) : *
      {
         cls_2.changeMap(cls.actorID);
      }
      
      public function onClick59_0Handler(param1:MouseEvent) : *
      {
         cls_59_0.changeMap(57);
      }
      
      public function onClick59Handler(param1:MouseEvent) : *
      {
         cls_59.changeMap(57);
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
      
      internal function frame10() : *
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
      
      public function onClick1Handler(param1:MouseEvent) : *
      {
         cls_1.changeMap(107);
      }
      
      public function onClick0Handler(param1:MouseEvent) : *
      {
         cls_0.changeMap(102);
      }
      
      internal function frame1() : *
      {
         stop();
         this["btn1"].addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            gotoAndStop(3);
         });
         this["btn2"].addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            gotoAndStop(4);
         });
         this["btn3"].addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            gotoAndStop(5);
         });
         this["btn4"].addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            gotoAndStop(2);
         });
      }
      
      public function onClick4Handler(param1:MouseEvent) : *
      {
         cls_4.changeMap(8);
      }
      
      internal function frame4() : *
      {
         stop();
         try
         {
            cls_59_0 = getDefinitionByName("com.robot.core.manager.MapManager");
            goMapBtn_59_0.addEventListener(MouseEvent.CLICK,onClick59_0Handler);
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame6() : *
      {
         stop();
         try
         {
            cls_0 = getDefinitionByName("com.robot.core.manager.MapManager");
            goMapBtn_0.addEventListener(MouseEvent.CLICK,onClick0Handler);
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
            cls_map_8 = getDefinitionByName("com.robot.core.manager.MapManager");
            goMapBtn_map_8.addEventListener(MouseEvent.CLICK,onClickMap_8Handler);
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
            cls_59 = getDefinitionByName("com.robot.core.manager.MapManager");
            goMapBtn_59.addEventListener(MouseEvent.CLICK,onClick59Handler);
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
            cls_59_1 = getDefinitionByName("com.robot.core.manager.MapManager");
            goMapBtn_59_1.addEventListener(MouseEvent.CLICK,onClick59_1Handler);
         }
         catch(e:Error)
         {
         }
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
      
      internal function frame7() : *
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
      
      public function onClick8Handler(param1:MouseEvent) : *
      {
         cls_8.changeMap(107);
      }
      
      internal function frame8() : *
      {
         stop();
         try
         {
            cls_2 = getDefinitionByName("com.robot.core.manager.MapManager");
            cls = getDefinitionByName("com.robot.core.manager.MainManager");
            goMapBtn_2.addEventListener(MouseEvent.CLICK,onClick2Handler);
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
            cls_3 = getDefinitionByName("com.robot.core.manager.MapManager");
            goMapBtn_3.addEventListener(MouseEvent.CLICK,onClick3Handler);
         }
         catch(e:Error)
         {
         }
      }
      
      public function onClickMap_8Handler(param1:MouseEvent) : *
      {
         cls_map_8.changeMap(8);
      }
   }
}

