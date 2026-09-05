package
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol432")]
   public dynamic class SeerBookReservationMc extends MovieClip
   {
      
      public var __id9_:MovieClip;
      
      public var __id5_:MovieClip;
      
      public var __id1_:MovieClip;
      
      public var __id6_:MovieClip;
      
      public var __id2_:MovieClip;
      
      public var prevBtn:SimpleButton;
      
      public var __id7_:MovieClip;
      
      public var closeBtn:SimpleButton;
      
      public var __id3_:MovieClip;
      
      public var total:uint;
      
      public var btn1:SimpleButton;
      
      public var btn2:SimpleButton;
      
      public var btn3:SimpleButton;
      
      public var btn0:SimpleButton;
      
      public var btn:SimpleButton;
      
      public var __id8_:MovieClip;
      
      public var __id4_:MovieClip;
      
      public var i1:int;
      
      public var nextBtn:SimpleButton;
      
      public var __id0_:MovieClip;
      
      public var __setPropDict:Dictionary = new Dictionary(true);
      
      public function SeerBookReservationMc()
      {
         super();
         addFrameScript(0,frame1,1,frame2,13,frame14,3,frame4,4,frame5,5,frame6,6,frame7,8,frame9,9,frame10,10,frame11,11,frame12);
      }
      
      internal function __setProp___id5___12() : *
      {
         try
         {
            __id5_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id5_.itemID = 200074;
         try
         {
            __id5_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id8__() : *
      {
         try
         {
            __id8_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id8_.itemID = 200087;
         try
         {
            __id8_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame7() : *
      {
         if(__setPropDict[__id2_] == undefined || int(__setPropDict[__id2_]) != 7)
         {
            __setPropDict[__id2_] = 7;
            __setProp___id2___7();
         }
         if(__setPropDict[__id1_] == undefined || int(__setPropDict[__id1_]) != 7)
         {
            __setPropDict[__id1_] = 7;
            __setProp___id1___5();
         }
         if(__setPropDict[__id0_] == undefined || int(__setPropDict[__id0_]) != 7)
         {
            __setPropDict[__id0_] = 7;
            __setProp___id0___3();
         }
      }
      
      internal function __setProp___id6__() : *
      {
         try
         {
            __id6_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id6_.itemID = 200088;
         try
         {
            __id6_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      public function onLinkHandler(param1:MouseEvent) : void
      {
         this.dispatchEvent(new Event("linkToPayUrl"));
      }
      
      internal function frame5() : *
      {
         if(__setPropDict[__id2_] == undefined || int(__setPropDict[__id2_]) != 5)
         {
            __setPropDict[__id2_] = 5;
            __setProp___id2__();
         }
         if(__setPropDict[__id1_] == undefined || int(__setPropDict[__id1_]) != 5)
         {
            __setPropDict[__id1_] = 5;
            __setProp___id1__();
         }
         if(__setPropDict[__id0_] == undefined || int(__setPropDict[__id0_]) != 5)
         {
            __setPropDict[__id0_] = 5;
            __setProp___id0___1();
         }
      }
      
      internal function frame14() : *
      {
         btn.addEventListener(MouseEvent.CLICK,onLinkHandler);
         btn2.addEventListener(MouseEvent.CLICK,onLinkHandler1);
      }
      
      internal function __setProp___id5___11() : *
      {
         try
         {
            __id5_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id5_.itemID = 200095;
         try
         {
            __id5_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      public function onNexthandler(param1:MouseEvent) : void
      {
         if(this.currentFrame < total)
         {
            this.gotoAndStop(this.currentFrame + 1);
         }
      }
      
      internal function frame10() : *
      {
         if(__setPropDict[__id8_] == undefined || int(__setPropDict[__id8_]) != 10)
         {
            __setPropDict[__id8_] = 10;
            __setProp___id8__();
         }
         if(__setPropDict[__id7_] == undefined || int(__setPropDict[__id7_]) != 10)
         {
            __setPropDict[__id7_] = 10;
            __setProp___id7__();
         }
         if(__setPropDict[__id6_] == undefined || int(__setPropDict[__id6_]) != 10)
         {
            __setPropDict[__id6_] = 10;
            __setProp___id6__();
         }
         if(__setPropDict[__id5_] == undefined || int(__setPropDict[__id5_]) != 10)
         {
            __setPropDict[__id5_] = 10;
            __setProp___id5__();
         }
         if(__setPropDict[__id4_] == undefined || int(__setPropDict[__id4_]) != 10)
         {
            __setPropDict[__id4_] = 10;
            __setProp___id4__();
         }
         if(__setPropDict[__id3_] == undefined || int(__setPropDict[__id3_]) != 10)
         {
            __setPropDict[__id3_] = 10;
            __setProp___id3___8();
         }
      }
      
      internal function __setProp___id6___13() : *
      {
         try
         {
            __id6_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id6_.itemID = 200094;
         try
         {
            __id6_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id9__() : *
      {
         try
         {
            __id9_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id9_.itemID = 200096;
         try
         {
            __id9_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id1__() : *
      {
         try
         {
            __id1_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id1_.itemID = 200111;
         try
         {
            __id1_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id3__() : *
      {
         try
         {
            __id3_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id3_.itemID = 200075;
         try
         {
            __id3_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      public function onBtnClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:String = param1.currentTarget.name;
         var _loc3_:uint = uint(_loc2_.slice(3,_loc2_.length));
         if(_loc3_ == 0)
         {
            gotoAndStop(3);
         }
         else if(_loc3_ == 1)
         {
            gotoAndStop(8);
         }
         else if(_loc3_ == 4)
         {
            gotoAndStop(13);
         }
      }
      
      public function onLinkHandler1(param1:MouseEvent) : void
      {
         this.dispatchEvent(new Event("linkToPassUrl"));
      }
      
      internal function __setProp___id7__() : *
      {
         try
         {
            __id7_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id7_.itemID = 200089;
         try
         {
            __id7_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame11() : *
      {
         if(__setPropDict[__id9_] == undefined || int(__setPropDict[__id9_]) != 11)
         {
            __setPropDict[__id9_] = 11;
            __setProp___id9__();
         }
         if(__setPropDict[__id6_] == undefined || int(__setPropDict[__id6_]) != 11)
         {
            __setPropDict[__id6_] = 11;
            __setProp___id6___13();
         }
         if(__setPropDict[__id5_] == undefined || int(__setPropDict[__id5_]) != 11)
         {
            __setPropDict[__id5_] = 11;
            __setProp___id5___11();
         }
         if(__setPropDict[__id3_] == undefined || int(__setPropDict[__id3_]) != 11)
         {
            __setPropDict[__id3_] = 11;
            __setProp___id3___9();
         }
      }
      
      internal function frame12() : *
      {
         if(__setPropDict[__id5_] == undefined || int(__setPropDict[__id5_]) != 12)
         {
            __setPropDict[__id5_] = 12;
            __setProp___id5___12();
         }
         if(__setPropDict[__id3_] == undefined || int(__setPropDict[__id3_]) != 12)
         {
            __setPropDict[__id3_] = 12;
            __setProp___id3___10();
         }
      }
      
      internal function __setProp___id3___10() : *
      {
         try
         {
            __id3_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id3_.itemID = 200073;
         try
         {
            __id3_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      public function onPrevhandler(param1:MouseEvent) : void
      {
         if(this.currentFrame > 1)
         {
            this.gotoAndStop(this.currentFrame - 1);
         }
      }
      
      internal function frame1() : *
      {
         stop();
         total = this.totalFrames;
         nextBtn.addEventListener(MouseEvent.CLICK,onNexthandler);
         prevBtn.addEventListener(MouseEvent.CLICK,onPrevhandler);
      }
      
      internal function frame2() : *
      {
         i1 = 0;
         while(i1 < 4)
         {
            this["btn" + i1].addEventListener(MouseEvent.CLICK,onBtnClickHandler);
            ++i1;
         }
      }
      
      internal function frame4() : *
      {
         if(__setPropDict[__id0_] == undefined || int(__setPropDict[__id0_]) != 4)
         {
            __setPropDict[__id0_] = 4;
            __setProp___id0__();
         }
      }
      
      internal function frame9() : *
      {
         if(__setPropDict[__id3_] == undefined || int(__setPropDict[__id3_]) != 9)
         {
            __setPropDict[__id3_] = 9;
            __setProp___id3__();
         }
      }
      
      internal function __setProp___id0___1() : *
      {
         try
         {
            __id0_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id0_.itemID = 200110;
         try
         {
            __id0_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id0___2() : *
      {
         try
         {
            __id0_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id0_.itemID = 200114;
         try
         {
            __id0_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id0___3() : *
      {
         try
         {
            __id0_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id0_.itemID = 200077;
         try
         {
            __id0_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame6() : *
      {
         if(__setPropDict[__id2_] == undefined || int(__setPropDict[__id2_]) != 6)
         {
            __setPropDict[__id2_] = 6;
            __setProp___id2___6();
         }
         if(__setPropDict[__id1_] == undefined || int(__setPropDict[__id1_]) != 6)
         {
            __setPropDict[__id1_] = 6;
            __setProp___id1___4();
         }
         if(__setPropDict[__id0_] == undefined || int(__setPropDict[__id0_]) != 6)
         {
            __setPropDict[__id0_] = 6;
            __setProp___id0___2();
         }
      }
      
      internal function __setProp___id1___4() : *
      {
         try
         {
            __id1_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id1_.itemID = 200115;
         try
         {
            __id1_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id1___5() : *
      {
         try
         {
            __id1_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id1_.itemID = 200117;
         try
         {
            __id1_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id2___6() : *
      {
         try
         {
            __id2_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id2_.itemID = 200116;
         try
         {
            __id2_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id2___7() : *
      {
         try
         {
            __id2_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id2_.itemID = 200113;
         try
         {
            __id2_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id3___8() : *
      {
         try
         {
            __id3_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id3_.itemID = 200091;
         try
         {
            __id3_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id3___9() : *
      {
         try
         {
            __id3_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id3_.itemID = 200093;
         try
         {
            __id3_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id5__() : *
      {
         try
         {
            __id5_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id5_.itemID = 200090;
         try
         {
            __id5_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id0__() : *
      {
         try
         {
            __id0_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id0_.itemID = 200109;
         try
         {
            __id0_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id2__() : *
      {
         try
         {
            __id2_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id2_.itemID = 200112;
         try
         {
            __id2_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id4__() : *
      {
         try
         {
            __id4_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id4_.itemID = 200092;
         try
         {
            __id4_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
   }
}

